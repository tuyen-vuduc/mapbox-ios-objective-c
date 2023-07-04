#import "SceneKitExample.h"

#import <SceneKit/SceneKit.h>
#import <Metal/Metal.h>
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import "ExampleProtocol.h"

typedef void (^RenderingWillEndHandler)(void);

@interface SceneKitExampleCustomLayerHost : NSObject<MBMCustomLayerHost>

@property (readonly) CLLocationCoordinate2D modelOrigin;
@property SCNRenderer* renderer;
@property SCNScene* scene;
@property SCNNode* modelNode;
@property SCNNode* cameraNode;
@property SCNNode* textNode;
@property BOOL useCPUOcclusion;
@property (readonly) RenderingWillEndHandler renderingWillEndHandler;

- (instancetype)initWithModelOrigin: (CLLocationCoordinate2D) modelOrigin
            renderingWillEndHandler: (RenderingWillEndHandler) renderingWillEndHandler;

@end

@interface SceneKitExample () <ExampleProtocol>

@property (readonly) CLLocationCoordinate2D modelOrigin;
@property MapView* mapView;
- (void) addModelAndTerrain;

@end

@implementation SceneKitExample

- (void)viewDidLoad {
    [super viewDidLoad];
    _modelOrigin = CLLocationCoordinate2DMake(-35.39847, 148.9819);
    
    CLLocation* centerLocation = [[CLLocation alloc] initWithLatitude: self.modelOrigin.latitude
                                                            longitude: self.modelOrigin.longitude];
    
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:centerLocation
                                                                       padding:nil
                                                                        anchor:nil
                                                                          zoom:@18
                                                                       bearing:@180
                                                                         pitch:@60];
    
    MapInitOptions* options = [MapInitOptionsFactory createWithResourceOptions:nil mapOptions:nil cameraOptions:cameraOptions styleURI:nil styleJSON:nil];
    
    MapView* mapView = [MapViewFactory createWithFrame:self.view.bounds
                                               options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    __weak SceneKitExample *weakSelf = self;
    [[mapView mapboxMap] onStyleLoaded:^(id _Nonnull) {
        [weakSelf addModelAndTerrain];
        
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
    
    self.mapView = mapView;
    [self.view addSubview:mapView];
}

- (SkyLayerBuilder *) createSkyLayerBuilder {
    SkyLayerBuilder* builder = [SkyLayerBuilder withId:@"sky-layer"];
    
    TMBValue* skyType = [TMBValue constant: TMBSkyType.atmosphere];
    [builder skyType: skyType];
    TMBValue* skyAtmosphereSun = [TMBValue constant: @[@0.0, @0.0]];
    [builder skyAtmosphereSun: skyAtmosphereSun];
    TMBValue* skyAtmosphereSunIntensity = [TMBValue constant: @15.0];
    [builder skyAtmosphereSunIntensity: skyAtmosphereSunIntensity];
    
    return builder;
}

- (void) addModelAndTerrain {
    __weak SceneKitExample *weakSelf = self;
    SceneKitExampleCustomLayerHost* layerHost = [[SceneKitExampleCustomLayerHost alloc] initWithModelOrigin:self.modelOrigin
                                                                                    renderingWillEndHandler:^{
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
    
    [self.mapView addCustomLayer: @"Custom"
                       layerHost: layerHost
                   layerPosition: TMBLayerPosition.below()
              layerPositionParam: @"waterway-label"
                         onError:^(NSError * _Nonnull _) {
        // Do something here
    }];
    
    NSString* sourceId = @"mapbox-dem";
    [self.mapView addRasterDemSource: sourceId
                           configure:^(RasterDemSourceBuilder * _Nonnull builder) {
        [builder url:@"mapbox://mapbox.mapbox-terrain-dem-v1"];
        [builder tileSize:512.0];
        [builder maxzoom:14.0];
    }
                             onError:nil];

    TMBTerrain* terrain = [[TMBTerrain alloc] initWithSourceId:sourceId];
    TMBValue* value = [[TMBValue alloc] initWithConstant:@1.5];
    terrain.exaggeration = value;

    [self.mapView setTerrain:terrain onError:nil];

    [self.mapView addLayerWithTarget: self
                            selector: @selector(createSkyLayerBuilder)
                       layerPosition: TMBLayerPositionUnowned
                  layerPositionParam: nil
                             onError: nil];

    // Re-use terrain source for hillshade
    NSDictionary* properties = @{
        @"id": @"terrain_hillshade",
        @"type": @"hillshade",
        @"source": @"mapbox-dem",
        @"hillshade-illumination-anchor": @"map"
    };

    [self.mapView addLayerWithProperties: properties
                           layerPosition: TMBLayerPositionBelow
                      layerPositionParam:@"water"
                                 onError:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

@implementation SceneKitExampleCustomLayerHost

- (instancetype)initWithModelOrigin: (CLLocationCoordinate2D) modelOrigin
            renderingWillEndHandler: (RenderingWillEndHandler) renderingWillEndHandler {
    self = [super init];
    
    _modelOrigin = modelOrigin;
    _renderingWillEndHandler = renderingWillEndHandler;
    
    return self;
}

- (void)renderingWillStart:(id<MTLDevice>)metalDevice
          colorPixelFormat:(NSUInteger)colorPixelFormat
   depthStencilPixelFormat:(NSUInteger)depthStencilPixelFormat {
    self.renderer = [SCNRenderer rendererWithDevice:metalDevice
                                            options:nil];
    self.scene = [SCNScene new];
    self.renderer.scene = self.scene;
    
    self.modelNode = [[SCNScene sceneNamed:@"34M_17"].rootNode clone];
    [self.scene.rootNode addChildNode: self.modelNode];
    
    self.cameraNode = [[SCNNode alloc] init];
    
    SCNCamera* camera = [[SCNCamera alloc] init];
    self.cameraNode.camera = camera;
    camera.usesOrthographicProjection = false;
    [self.scene.rootNode addChildNode:self.cameraNode];
    self.renderer.pointOfView = self.cameraNode;
    
    [self setupLight];
    
    if (@available(iOS 13.0, *)) {
        self.renderer.usesReverseZ = false;
    } else {
        // Fallback on earlier versions, disable depth in render()
        self.useCPUOcclusion = true;
    }
}

- (void) setupLight {
    // Ambient light
    SCNNode* ambientLight = [SCNNode new];
    ambientLight.light = [SCNLight new];
    ambientLight.light.type = SCNLightTypeAmbient;
    ambientLight.light.color = [UIColor colorWithWhite:0.4 alpha:1.0];
    
    [self.modelNode addChildNode: ambientLight];
    
    SCNNode* lightNode = [SCNNode new];
    lightNode.light = [SCNLight new];
    lightNode.light.type = SCNLightTypeDirectional;
    lightNode.light.orthographicScale = 30;
    lightNode.light.color = [UIColor colorWithWhite: 0.8 alpha: 1.0];
    lightNode.position = SCNVector3Make(-50, 100, 100);
    lightNode.light.zNear = 1;
    lightNode.light.zFar = 1000;
    lightNode.light.intensity = 2000;
    [lightNode lookAt: self.modelNode.worldPosition];
    [self.modelNode addChildNode: lightNode];
    
    SCNNode* pointNode = [SCNNode new];
    pointNode.light = [SCNLight new];
    pointNode.light.type = SCNLightTypeOmni;
    pointNode.light.intensity = 3000;
    pointNode.position = SCNVector3Make(0, 25, 0);
    [self.modelNode addChildNode: pointNode];
}

- (simd_double4x4) makeTranslationMatrixWithX: (double) x
                                            y: (double) y
                                            z: (double) z {
    simd_double4x4 matrix = matrix_identity_double4x4;
    
    matrix.columns[3][0] = x;
    matrix.columns[3][1] = y;
    matrix.columns[3][2] = z;
    
    return matrix;
}


- (simd_double4x4) makeScaleMatrixWithX: (double) x
                                      y: (double) y
                                      z: (double) z {
    simd_double4x4 matrix = matrix_identity_double4x4;
    
    matrix.columns[0][0] = x;
    matrix.columns[1][1] = y;
    matrix.columns[2][2] = z;
    
    return matrix;
}

- (void)renderingWillEnd {
    if (self.renderingWillEndHandler) {
        self.renderingWillEndHandler();
    }
}

- (void)render:(nonnull MBMCustomLayerRenderParameters *)parameters mtlCommandBuffer:(nonnull id<MTLCommandBuffer>)mtlCommandBuffer mtlRenderPassDescriptor:(nonnull MTLRenderPassDescriptor *)mtlRenderPassDescriptor {    
    id<MTLTexture> colorTexture = mtlRenderPassDescriptor.colorAttachments[0].texture;
    
    if (!colorTexture) {
        return;
    }
    
    NSArray<NSNumber *>* m = parameters.projectionMatrix;
    
    // It is essential to use double precision for computation below: using simd instead
    // of SceneKit matrix operations.
    simd_double4x4 transformSimd = matrix_identity_double4x4;
    transformSimd.columns[0][0] = m[0].doubleValue;
    transformSimd.columns[0][1] = m[1].doubleValue;
    transformSimd.columns[0][2] = m[2].doubleValue;
    transformSimd.columns[0][3] = m[3].doubleValue;
    transformSimd.columns[1][0] = m[4].doubleValue;
    transformSimd.columns[1][1] = m[5].doubleValue;
    transformSimd.columns[1][2] = m[6].doubleValue;
    transformSimd.columns[1][3] = m[7].doubleValue;
    transformSimd.columns[2][0] = m[8].doubleValue;
    transformSimd.columns[2][1] = m[9].doubleValue;
    transformSimd.columns[2][2] = m[10].doubleValue;
    transformSimd.columns[2][3] = m[11].doubleValue;
    transformSimd.columns[3][0] = m[12].doubleValue;
    transformSimd.columns[3][1] = m[13].doubleValue;
    transformSimd.columns[3][2] = m[14].doubleValue;
    transformSimd.columns[3][3] = m[15].doubleValue;
    
    // Model is using metric unit system: scale x and y from meters to mercator and keep z is in meters.
    double metersPerPoint = [MBMProjection getMetersPerPixelAtLatitudeForLatitude:self.modelOrigin.latitude
                                                                             zoom:parameters.zoom];
    double meterInMercatorCoordinateUnits = 1.0 / metersPerPoint;
    simd_double4x4 modelScale = [self makeScaleMatrixWithX:meterInMercatorCoordinateUnits
                                                         y:-meterInMercatorCoordinateUnits
                                                         z:1];
    
    MBMMercatorCoordinate* origin = [MBMProjection projectForCoordinate:self.modelOrigin
                                                              zoomScale:pow(2, parameters.zoom)];
    
    double elevation = 0.0;
    
    if (parameters.elevationData) {
        NSNumber* elevationData = [parameters.elevationData getElevationForCoordinate:self.modelOrigin];
        
        if (elevationData) {
            elevation = elevationData.doubleValue;
        }
    }
    simd_double4x4 translateModel = [self makeTranslationMatrixWithX: origin.x
                                                                   y: origin.y
                                                                   z: elevation];
    
    simd_double4x4 transform = simd_mul(simd_mul(transformSimd, translateModel), modelScale);
    
    SCNMatrix4 scnMat;
    
    scnMat.m11 = transform.columns[0][0];
    scnMat.m12 = transform.columns[0][1];
    scnMat.m13 = transform.columns[0][2];
    scnMat.m14 = transform.columns[0][3];
    scnMat.m21 = transform.columns[1][0];
    scnMat.m22 = transform.columns[1][1];
    scnMat.m23 = transform.columns[1][2];
    scnMat.m24 = transform.columns[1][3];
    scnMat.m31 = transform.columns[2][0];
    scnMat.m32 = transform.columns[2][1];
    scnMat.m33 = transform.columns[2][2];
    scnMat.m34 = transform.columns[2][3];
    scnMat.m41 = transform.columns[3][0];
    scnMat.m42 = transform.columns[3][1];
    scnMat.m43 = transform.columns[3][2];
    scnMat.m44 = transform.columns[3][3];
    
    self.cameraNode.camera.projectionTransform = scnMat;
    
    // flush automatic SceneKit transaction as SceneKit animation is not running and
    // there's need to use transform matrix in this frame (not to have it used with delay).
    [SCNTransaction flush];
    
    if (self.useCPUOcclusion) {
        mtlRenderPassDescriptor.depthAttachment = nil;
        mtlRenderPassDescriptor.stencilAttachment = nil;
        // Example uses depth buffer to occlude model when e.g. behind the hill.
        // If depth buffer (SCNRenderer.usesReverseZ = false) is not available, or if wished to
        // to indicate that model is occluded or e.g. implement fade out / fade in model occlusion,
        // the example here needs to provide CPU side occlusion implementation, too.
        // TODO: this is blocked on https://github.com/mapbox/mapbox-maps-ios/issues/155
    }
    
    CGRect viewPort = CGRectMake(0, 0, colorTexture.width, colorTexture.height);
    
    [self.renderer renderWithViewport: viewPort
                        commandBuffer: mtlCommandBuffer
                       passDescriptor: mtlRenderPassDescriptor];
    
}

@end
