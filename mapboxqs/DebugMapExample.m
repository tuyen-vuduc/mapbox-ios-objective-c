#import "DebugMapExample.h"
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import "UIColor+AdditionalColors.h"

@class SettingsViewController;
@protocol DebugOptionSettingsDelegate <NSObject>

- (void) debugOptionSettingsDidChange: (SettingsViewController *) vc;

@end


@interface DebugMapExample () <DebugOptionSettingsDelegate>

@property (strong) MapView* mapView;

@end

@interface SettingsViewController : UIViewController <UITableViewDataSource>

@property (strong, readonly) NSMutableArray* enabledDebugOptions;
@property (weak) id<DebugOptionSettingsDelegate> delegate;

- (instancetype) initWithDebugOptions: (NSArray *) debugOptions;

@end

@interface MapDebugOptionSetting : NSObject

@property (readonly) MBMMapDebugOptions debugOptions;
@property (readonly) NSString* displayTitle;

- (instancetype) initWithDebugOptions: (MBMMapDebugOptions) debugOptions displayTitle: (NSString *) displayTitle;

+ (MapDebugOptionSetting *) newWithDebugOptions: (MBMMapDebugOptions) debugOptions displayTitle: (NSString *) displayTitle;

@end

@implementation MapDebugOptionSetting

- (instancetype)initWithDebugOptions:(MBMMapDebugOptions)debugOptions
                        displayTitle:(NSString *)displayTitle {
    self = [super init];
    
    _debugOptions = debugOptions;
    _displayTitle = displayTitle;
    
    return self;
}

+ (MapDebugOptionSetting *)newWithDebugOptions:(MBMMapDebugOptions)debugOptions
                                  displayTitle:(NSString *)displayTitle {
    return [[MapDebugOptionSetting alloc] initWithDebugOptions:debugOptions
                                                  displayTitle:displayTitle];
}

@end

@interface DebugOptionCell : UITableViewCell

- (void) configureWithSetting: (MapDebugOptionSetting *) setting enabled: (BOOL) enabled;
- (void) onToggled: (void (^)(MapDebugOptionSetting*, bool))handler;

@end

@implementation DebugMapExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MapView* mapView = [MapViewFactory createWithFrame:self.view.bounds options:nil];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    TMBOrnamentOptions* ornamentOptions = [[mapView ornaments] options];
    [[ornamentOptions scaleBar] setVisibility:TMBOrnamentVisibilityVisible];
    
    if (@available(iOS 15.0, *)) {
        float maxFPS = UIScreen.mainScreen.maximumFramesPerSecond;
        CAFrameRateRange frameRateRange = CAFrameRateRangeMake(1, maxFPS, maxFPS);
        [mapView preferredFrameRateRange:frameRateRange];
    }
    self.mapView = mapView;
    [self.view addSubview:mapView];
    self.view.backgroundColor = [UIColor skyBlue];
    
    mapView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [mapView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [mapView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [mapView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [mapView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
    ]];
    
    UIBarButtonItem* editBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                                                                   target:self
                                                                                   action:@selector(openDebugOptionsMenu:)];
    self.navigationItem.rightBarButtonItem = editBarButton;
}

- (void) openDebugOptionsMenu: (UIBarButtonItem *) sender {
    NSArray* debugOptions = [self.mapView mapboxMapDebugOptions];
    SettingsViewController* settingsViewController = [[SettingsViewController alloc] initWithDebugOptions: debugOptions];
    settingsViewController.delegate = self;

    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController: settingsViewController];
    navigationController.modalPresentationStyle = UIModalPresentationPopover;
    navigationController.popoverPresentationController.barButtonItem = sender;
    
    [self presentViewController:navigationController animated:true completion:nil];
}

- (void)debugOptionSettingsDidChange:(SettingsViewController *)vc {
    [vc dismissViewControllerAnimated:true completion:nil];
    [self.mapView mapboxMapDebugOptions: vc.enabledDebugOptions];
}

@end


@interface SettingsViewController ()

@property (strong) UITableView* tableView;
@property (strong, readonly) NSArray<MapDebugOptionSetting *> * allSettings;

@end

@implementation SettingsViewController

- (instancetype)initWithDebugOptions:(NSArray *)debugOptions {
    _enabledDebugOptions = [debugOptions mutableCopy];
    _allSettings = [SettingsViewController availableSettings];
        
    self = [super initWithNibName:nil bundle:nil];
    return self;
}

+ (NSArray<MapDebugOptionSetting *> *) availableSettings {
    return @[
        [MapDebugOptionSetting newWithDebugOptions: MBMMapDebugOptionsCollision displayTitle: @"Debug collision"],
        [MapDebugOptionSetting newWithDebugOptions: MBMMapDebugOptionsDepthBuffer displayTitle: @"Show depth buffer"],
        [MapDebugOptionSetting newWithDebugOptions: MBMMapDebugOptionsOverdraw displayTitle: @"Debug overdraw"],
        [MapDebugOptionSetting newWithDebugOptions: MBMMapDebugOptionsParseStatus displayTitle: @"Show tile coordinate"],
        [MapDebugOptionSetting newWithDebugOptions: MBMMapDebugOptionsRenderCache displayTitle: @"Render Cache"],
        [MapDebugOptionSetting newWithDebugOptions: MBMMapDebugOptionsStencilClip displayTitle: @"Show stencil buffer"],
        [MapDebugOptionSetting newWithDebugOptions: MBMMapDebugOptionsTileBorders displayTitle: @"Debug tile clipping"],
        [MapDebugOptionSetting newWithDebugOptions: MBMMapDebugOptionsTimestamps displayTitle: @"Show tile loaded time"]
    ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Debug options";
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    [self.tableView registerClass:DebugOptionCell.class
           forCellReuseIdentifier:NSStringFromClass(DebugOptionCell.class)];
    
    [self.view addSubview:self.tableView];
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = false;
    [NSLayoutConstraint activateConstraints:@[
        [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
        [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor]
    ]];
    
    self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeNever;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                           target:self
                                                                                           action:@selector(saveSettings:)];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.preferredContentSize = self.tableView.contentSize;
}

- (void) saveSettings: (UIBarButtonItem *) button {
    if (self.delegate) {
        [self.delegate debugOptionSettingsDidChange:self];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allSettings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellID = NSStringFromClass(DebugOptionCell.class);
    DebugOptionCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    MapDebugOptionSetting* setting = self.allSettings[indexPath.row];
    
    NSNumber *value = [NSNumber numberWithInt:setting.debugOptions];
    BOOL enabled = [self.enabledDebugOptions containsObject: value];
    
    [cell configureWithSetting: setting enabled: enabled];
    
    [cell onToggled:^(MapDebugOptionSetting* setting, bool enabled) {
        NSNumber *option = [NSNumber numberWithInt:setting.debugOptions];

        if (enabled) {
            [self.enabledDebugOptions addObject:option];
        } else {
            [self.enabledDebugOptions removeObject:option];
        }
    }];
    
    return cell;
}

@end

typedef void (^OnToggleHandler)(MapDebugOptionSetting*, bool) ;

@interface DebugOptionCell()

@property UILabel* titleLabel;
@property UISwitch* toggle;
@property OnToggleHandler toggleHandler;
@property MapDebugOptionSetting* setting;

@end

@implementation DebugOptionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.titleLabel = [[UILabel alloc] init];
    self.toggle = [[UISwitch alloc] init];
    
    [self.toggle addTarget:self action:@selector(didToggle:) forControlEvents:UIControlEventValueChanged];
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.toggle];
    
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.toggle.translatesAutoresizingMaskIntoConstraints = false;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant: 16],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.titleLabel.topAnchor constraintGreaterThanOrEqualToAnchor: self.contentView.topAnchor constant: 8],
        [self.toggle.leftAnchor constraintGreaterThanOrEqualToAnchor: self.titleLabel.rightAnchor constant: 16],
        [self.toggle.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant: -16],
        [self.toggle.centerYAnchor constraintEqualToAnchor:self.titleLabel.centerYAnchor],
        [self.toggle.topAnchor constraintGreaterThanOrEqualToAnchor: self.contentView.topAnchor constant: 8],
    ]];
    
    return self;
}

- (void) didToggle: (UISwitch *) sender {
    self.toggleHandler(self.setting, sender.isOn);
}

- (void)configureWithSetting:(MapDebugOptionSetting *)setting enabled:(BOOL)enabled {
    self.titleLabel.text = setting.displayTitle;
    [self.toggle setOn: enabled];
    self.setting = setting;
}

- (void)onToggled:(OnToggleHandler) handler {
    self.toggleHandler = handler;
}

@end
