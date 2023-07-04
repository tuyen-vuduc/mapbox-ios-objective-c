//
//  OfflineManagerExample.m
//  mapboxqs
//
//  Created by Tuyen Vu on 11/03/2023.
//

#import "OfflineManagerExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import <MapboxCommon/MapboxCommon.h>
#import "MapboxMaps-Swift.h"


typedef enum State : int {
    state_unknown = 0,
    state_initial = 1,
    state_downloading = 2,
    state_downloaded = 3,
    state_mapViewDisplayed = 4,
    state_finished = 5
} StateEnum;

@interface OfflineManagerLogWriter : NSObject

- (instancetype)initWithTextView: (UITextView *) textView;
- (void) logWithMessage: (NSString *) message category: (NSString *) category color: (UIColor *) color;
- (void) reset;

@end

@interface OfflineManagerExample ()

@property (weak, nonatomic) IBOutlet UIView *mapViewContainer;
@property (weak, nonatomic) IBOutlet UIView *progressContainer;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextView *logView;
@property (weak, nonatomic) IBOutlet UIProgressView *stylePackProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *tileRegionProgressView;

@property (nonatomic) StateEnum state;

- (IBAction)didTapButton:(UIButton *)sender;

@end

@implementation OfflineManagerExample{
    MapView* mapView;
    
    MBXTileStore* tileStore;
    OfflineManagerLogWriter* logger;
    MapInitOptions* mapInitOptions;
    MBMOfflineManager* offlineManager;
    
    NSMutableArray* downloads;
    
    CLLocationCoordinate2D tokyoCoord;
    NSString* tileRegionId;
}

-(void)dealloc {
    [[MBXOfflineSwitch getInstance] setMapboxStackConnectedForConnected:true];
    [self removeTileRegionAndStylePack];
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    tokyoCoord = CLLocationCoordinate2DMake(35.682027, 139.769305);
    float tokyoZoom = 12;
    tileRegionId = @"myTileRegion";
    
    CLLocation* centerLocation = [[CLLocation alloc] initWithLatitude:tokyoCoord.latitude
                                                            longitude:tokyoCoord.longitude];
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:centerLocation
                                                                       padding:nil
                                                                        anchor:nil
                                                                          zoom:[NSNumber numberWithFloat:tokyoZoom]
                                                                       bearing:nil
                                                                         pitch:nil];
    
    mapInitOptions = [MapInitOptionsFactory createWithResourceOptions:nil mapOptions:nil cameraOptions:cameraOptions styleURI:BuiltInStyles.outdoors styleJSON:nil];
    
    offlineManager = [[MBMOfflineManager alloc] initWithResourceOptions:[mapInitOptions getResourceOptions]];
    
    downloads = [[NSMutableArray alloc] init];
    
    // Initialize a logger that writes into the text view
    logger = [[OfflineManagerLogWriter alloc] initWithTextView:self.logView];
    
    [self updateState:state_initial];
    
    // The following line is just for testing purposes.
    if ([self respondsToSelector:@selector(finish)]) {
        [self finish];
    }
}


// MARK: - Actions

- (void) downloadTileRegions {
    if (!tileStore) {
        return;
    }
    
    if (downloads.count > 0) return;
    
    dispatch_group_t dispatchGroup = dispatch_group_create();
    bool downloadError = false;

    // - - - - - - - -

    // 1. Create style package with loadStylePack() call.
    NSNumber *mode = [NSNumber numberWithLong:MBMGlyphsRasterizationModeIdeographsRasterizedLocally];
    MBMStylePackLoadOptions* stylePackLoadOptions = [[MBMStylePackLoadOptions alloc] initWithGlyphsRasterizationMode: mode
                                                                                                            metadata:@{ @"tag": @"my-outdoors-style-pack" }];

    dispatch_group_enter(dispatchGroup);
    
    TMBCancelable* stylePackDownload = [offlineManager loadStyleWithStyleUriString:BuiltInStyles.outdoors
                                                                  styleLoadOptions:stylePackLoadOptions
                                                                          progress:^(MBMStylePackLoadProgress * _Nonnull progress) {
        // These closures do not get called from the main thread. In this case
        // we're updating the UI, so it's important to dispatch to the main
        // queue.
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!self.stylePackProgressView) {
                return;
            }
            
            [self->logger logWithMessage: [NSString stringWithFormat:@"StylePackLoadProgress: %llu / %llu", progress.completedResourceCount, progress.requiredResourceCount]
                          category: @"Example"
                             color: nil];
            
            self.stylePackProgressView.progress = progress.completedResourceCount * 1.0f / progress.requiredResourceCount;
        });
    }
                                                                        completion:^(MBMStylePack * _Nullable stylePack, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                [self->logger logWithMessage:[NSString stringWithFormat:@"stylePack download Error = %@", error]
                                    category:@"Example"
                                       color:[UIColor redColor]];
                return;
            }
            
            [self->logger logWithMessage:[NSString stringWithFormat:@"StylePack %@: %llu / %llu", stylePack.styleURI, stylePack.completedResourceCount, stylePack.requiredResourceCount]
                                category:@"Example"
                                   color:nil];
            
            dispatch_group_leave(dispatchGroup);
        });
    }];
    
    // - - - - - - - -

    // 2. Create an offline region with tiles for the outdoors style
    MBMTilesetDescriptorOptions* outdoorsOptions = [[MBMTilesetDescriptorOptions alloc] initWithStyleURI:BuiltInStyles.outdoors
                                                                                                 minZoom:0
                                                                                                 maxZoom:16
                                                                                        stylePackOptions:nil];;
    MBXTilesetDescriptor* outdoorsDescriptor = [offlineManager createTilesetDescriptorForTilesetDescriptorOptions:outdoorsOptions];
        
    // Load the tile region
    CGPoint point = CGPointMake(tokyoCoord.latitude, tokyoCoord.longitude);
    MBXGeometry *geometry = [[MBXGeometry alloc] initWithPoint:[NSValue valueWithCGPoint:point]];
    MBXTileRegionLoadOptions* tileRegionLoadOptions = [[MBXTileRegionLoadOptions alloc] initWithGeometry:geometry
                                                                                             descriptors:@[outdoorsDescriptor]
                                                                                                metadata:@{ @"tag": @"my-outdoors-tile-region" }
                                                                                           acceptExpired:true
                                                                                      networkRestriction:MBXNetworkRestrictionNone
                                                                                           startLocation:nil
                                                                                   averageBytesPerSecond:nil
                                                                                            extraOptions:nil];
    
    // Use the the default TileStore to load this region. You can create
    // custom TileStores are are unique for a particular file path, i.e.
    // there is only ever one TileStore per unique path.
    dispatch_group_enter(dispatchGroup);
    
    TMBCancelable* tileRegionDownload = [tileStore loadTileRegionForId:tileRegionId
                                                           loadOptions:tileRegionLoadOptions
                                                              progress:^(MBXTileRegionLoadProgress * _Nonnull progress) {
        // These closures do not get called from the main thread. In this case
        // we're updating the UI, so it's important to dispatch to the main
        // queue.
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!self.tileRegionProgressView) return;
            
            [self->logger logWithMessage:[NSString stringWithFormat:@"TileRegionLoadProgress: %llu / %llu", progress.completedResourceCount, progress.requiredResourceCount] category:@"Example" color:nil];
            
            self.tileRegionProgressView.progress = progress.completedResourceCount * 1.0f/progress.requiredResourceCount;
        });
    } completion:^(MBXTileRegion * _Nullable tileRegion, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_group_leave(dispatchGroup);
            
            if (error) {
                [self->logger logWithMessage:[NSString stringWithFormat:@"tileRegion download Error = %@", error]
                                    category:@"Example"
                                       color:[UIColor redColor]];
                return;
            }
            
            [self->logger logWithMessage:[NSString stringWithFormat:@"titleRegion = %@", tileRegion]
                                category:@"Example"
                                   color:nil];
        });
    }];

    // Wait for both downloads before moving to the next state
    dispatch_notify(dispatchGroup, dispatch_get_main_queue(), ^() {
        self->downloads = @[].mutableCopy;
        
        if (downloadError) {
            [self updateState:state_finished];
        } else {
            [self updateState:state_downloaded];
        }
    });
    
    downloads = @[stylePackDownload, tileRegionDownload].mutableCopy;
    [self updateState:state_downloading];
}

- (void) cancelDownloads {
    // Canceling will trigger `.canceled` errors that will then change state
    [downloads enumerateObjectsUsingBlock:^(TMBCancelable*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [obj cancel];
    }];
}

- (void) logDownloadResultWithMessage: (NSString*) message result: (NSArray*) array error: (NSError*) error {
    if (error) {
        [logger logWithMessage:[NSString stringWithFormat:@"%@ %@", message, error]
                      category:@"Example"
                         color:[UIColor redColor]];
        return;
    }
    [logger logWithMessage:[NSString stringWithFormat:@"%@", message]
                  category:@"Example"
                     color:nil];
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self->logger logWithMessage:[NSString stringWithFormat:@"\t%@", obj]
                      category:@"Example"
                         color:nil];
    }];
}

- (void) showDownloadedRegions {
    if (!tileStore) {
        return;
    }
    
    [offlineManager allStylePacks:^(NSArray<MBMStylePack *> * _Nullable result, NSError * _Nullable error) {
        [self logDownloadResultWithMessage:@"Style packs:"
                                    result:result
                                     error:error];
    }];
    
    [tileStore allTileRegions:^(NSArray<MBXTileRegion *> * _Nullable result, NSError * _Nullable error) {
        [self logDownloadResultWithMessage:@"Tile regions:"
                                    result:result
                                     error:error];
    }];
    
    [logger logWithMessage:@"\n" category:@"Example" color:nil];
}

// Remove downloaded region and style pack
- (void) removeTileRegionAndStylePack {
    // Clean up after the example. Typically, you'll have custom business
    // logic to decide when to evict tile regions and style packs

    // Remove the tile region with the tile region ID.
    // Note this will not remove the downloaded tile packs, instead, it will
    // just mark the tileset as not a part of a tile region. The tiles still
    // exists in a predictive cache in the TileStore.
    [tileStore removeTileRegionForId:tileRegionId];

    // Set the disk quota to zero, so that tile regions are fully evicted
    // when removed. The TileStore is also used when `ResourceOptions.isLoadTilePacksFromNetwork`
    // is `true`, and also by the Navigation SDK.
    // This removes the tiles from the predictive cache.
    [tileStore setOptionForKey:MBXTileStoreOptions.DiskQuota value:[NSNumber numberWithInt:0]];

    // Remove the style pack with the style uri.
    // Note this will not remove the downloaded style pack, instead, it will
    // just mark the resources as not a part of the existing style pack. The
    // resources still exists in the disk cache.
    [offlineManager removeStylePackForStyleURI:BuiltInStyles.outdoors];
}

- (void)didTapButton:(UIButton *)sender {
    switch (self.state) {
    case state_unknown:
            [self updateState:state_initial];
        break;
    case state_initial:
        [self downloadTileRegions];
        break;
    case state_downloading:
        // Cancel
        [self cancelDownloads];
        break;
    case state_downloaded:
            [self updateState:state_mapViewDisplayed];
        break;
    case state_mapViewDisplayed:
        [self showDownloadedRegions];
            [self updateState:state_finished];
        break;
    case state_finished:
        [self removeTileRegionAndStylePack];
        [self showDownloadedRegions];
        [self updateState:state_initial];
        break;
    }
}

- (NSString*) stateString: (StateEnum) value {
    switch (value) {
        case state_initial:
            return @"initial";
        case state_finished:
            return @"finished";
        case state_downloaded:
            return @"downloaded";
        case state_downloading:
            return @"downloading";
        case state_mapViewDisplayed:
            return @"mapViewDisplayed";
        case state_unknown:
            return @"unknown";
    }
}

- (void) updateState:(StateEnum)newValue {
    StateEnum oldValue = self.state;
    self.state = newValue;
    
    [logger logWithMessage:[NSString stringWithFormat:@"Changing state from %@ -> %@", [self stateString:oldValue], [self stateString:newValue]]
                  category:@"Example"
                     color:[UIColor orangeColor]];

    switch (newValue) {
        case state_initial: {
            [self resetUI];

            MBXTileStore* tileStore = [MBXTileStore getDefault];
            NSString *accessToken = TMBResourceOptionsManager.default_.resourceOptions.accessToken;
            [tileStore setOptionForKey:MBXTileStoreOptions.MapboxAccessToken value:accessToken];
            
            self->tileStore = tileStore;

            [logger logWithMessage:@"Enabling HTTP stack network connection" category:@"Example" color:[UIColor orangeColor]];
            
            [[MBXOfflineSwitch getInstance] setMapboxStackConnectedForConnected:true];
            break;
        }
        case state_downloading:
            if (oldValue == state_initial) {
                // Can cancel
                [self.button setTitle:@"Cancel Downloads" forState:UIControlStateNormal];
            }
            break;
        case state_downloaded:
            if (oldValue == state_downloading) {
                [logger logWithMessage:@"Disabling HTTP stack network connection" category:@"Example" color:[UIColor orangeColor]];
                [[MBXOfflineSwitch getInstance] setMapboxStackConnectedForConnected:false];
                [self enableShowMapView];
            }
            break;

        case state_mapViewDisplayed:
            if (oldValue == state_downloaded) {
                [self showMapView];
            }
            break;

        case state_finished:
            if (oldValue == state_mapViewDisplayed || oldValue == state_downloading) {
                [self.button setTitle:@"Reset" forState:UIControlStateNormal];
            }
            break;

        default:
    //        ("Invalid transition from \(oldValue) to \(state)")
            break;
    }
}


- (void) resetUI{
    [logger reset];
    
    self.logView.textContainerInset = UIEdgeInsetsMake(
                                                       self.logView.textContainerInset.top,
                                                       self.logView.textContainerInset.left,
                                                       self.view.safeAreaInsets.bottom,
                                                       self.logView.textContainerInset.right);
    self.logView.scrollIndicatorInsets = UIEdgeInsetsMake(
                                                     self.logView.scrollIndicatorInsets.top,
                                                     self.logView.scrollIndicatorInsets.left,
                                                     self.view.safeAreaInsets.bottom,
                                                     self.logView.scrollIndicatorInsets.right);

    self.progressContainer.hidden = false;
    self.stylePackProgressView.progress = 0.0;
    self.tileRegionProgressView.progress = 0.0;

    [self.button setTitle:@"Start Downloads" forState:UIControlStateNormal];

    [mapView removeFromSuperview];
    mapView = nil;
}

- (void) enableShowMapView {
    [self.button setTitle:@"Show Map" forState:UIControlStateNormal];
}
- (void) showMapView {
    [self. button setTitle:@"Show Downloads" forState:UIControlStateNormal];
    self.progressContainer.hidden = true;

    // It's important that the MapView use the same ResourceOptions as the
    // OfflineManager
    MapView* mapView = [MapViewFactory createWithFrame:self.mapViewContainer.bounds
                                               options:mapInitOptions];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.mapViewContainer addSubview:mapView];

    // Add a point annotation that shows the point geometry that were passed
    // to the tile region API.
    __weak OfflineManagerExample* weakSelf = self;
    [[mapView mapboxMap] onStyleLoaded:^(id _Nonnull _) {
        if (!self->mapView) {
            return;
        }
        
        TMBPointAnnotation* pointAnnotation = [TMBPointAnnotation fromCoordinate:self->tokyoCoord];
        [pointAnnotation image:[UIImage imageNamed:@"custom_marker"] name:@"custom-marker"];
        
        TMBPointAnnotationManager* pointAnnotationManager = [[mapView annotations] makePointAnnotationManagerWithId:nil
                                                                                    layerPosition:nil
                                                                                   clusterOptions:nil];
        pointAnnotationManager.annotations = @[pointAnnotation];
    }];

    self->mapView = mapView;
}

@end



/// Convenience logger to write logs to the text view
@implementation OfflineManagerLogWriter {
    UITextView* textView;
    NSMutableAttributedString* log;
}

- (instancetype)initWithTextView: (UITextView *) textView {
    self->textView = textView;
    log = [NSMutableAttributedString new];
    return [super init];
}

- (void) reset{
    log = [NSMutableAttributedString new];
    textView.attributedText = log;
}

- (void) logWithMessage: (NSString *) message category: (NSString *) category color: (UIColor *) color {
    NSLog(@"[%@] %@", category, message);
    
    if (!color) {
        color = [UIColor blackColor];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        if (!self->textView || !self->log) return;
        
        NSMutableAttributedString* xmessage = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", message]
                                                                                     attributes:@{
            NSForegroundColorAttributeName: color
        }];
        
        [self->log appendAttributedString:xmessage];
        
        self->textView.attributedText = self->log;
    });
}

@end
