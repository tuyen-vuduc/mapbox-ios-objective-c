#import "SceneKitExample.h"

#import <SceneKit/SceneKit.h>
#import <MapboxMaps/MapboxMaps.h>
#import <MapboxCoreMaps/MapboxCoreMaps.h>
#import <MapboxMapObjC/MapboxMapObjC.h>
#import "MapboxMaps-Swift.h"
#import "ExampleProtocol.h"

@class SceneKitExampleCustomLayerHost;

@interface SceneKitExample () <ExampleProtocol>

@property MapView* mapView;
- (void) addModelAndTerrain;

@end

@implementation SceneKitExample

- (void)viewDidLoad {
    [super viewDidLoad];
    CLLocation* centerLocation = [[CLLocation alloc] initWithLatitude:-35.39847
                                                            longitude: 148.9819];
    
    MBMCameraOptions* cameraOptions = [[MBMCameraOptions alloc] initWithCenter:centerLocation
                                                                       padding:nil
                                                                        anchor:nil
                                                                          zoom:@18
                                                                       bearing:@180
                                                                         pitch:@60];
    
    MapInitOptionsBuilder* builder = [MapInitOptionsBuilder create];
    
    MapInitOptions* options = [[builder
                                    cameraOptions:cameraOptions] build];
    
    MapView* mapView = [MapViewFactory createWithFrame:self.view.bounds
                                               options:options];
    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    __weak SceneKitExample *weakSelf = self;
    [mapView onStyleLoaded:^(id _Nonnull) {
        [weakSelf addModelAndTerrain];
        
        if ([weakSelf respondsToSelector:@selector(finish)]) {
            [weakSelf finish];
        }
    }];
    
    self.mapView = mapView;
    [self.view addSubview:mapView];
}

- (void) addModelAndTerrain {
    NSString* sourceId = @"mapbox-dem";
    [self.mapView addRasterDemSource: sourceId
                           configure:^(RasterDemSourceBuilder * _Nonnull builder) {
        [builder url:@"mapbox://mapbox.mapbox-terrain-dem-v1"];
        [builder tileSize:512.0];
        [builder maxzoom:14.0];
    }
                             onError:nil];
    
    MBXTerrain* terrain = [[MBXTerrain alloc] initWithSourceId:sourceId];
    MBXValue* value = [[MBXValue alloc] initWithConstant:@1.5];
    terrain.exaggeration = value;
    
    [self.mapView setTerrain:terrain onError:nil];
    
    [self.mapView addSkyLayer:@"sky-layer"
                    configure:^(SkyLayerBuilder * _Nonnull builder) {
        MBXValue* skyType = [MBXValue constant: [NSNumber numberWithInt:MBXSkyTypeAtmosphere]];
        [builder skyType: skyType];
        MBXValue* skyAtmosphereSun = [MBXValue constant: @[@0.0, @0.0]];
        [builder skyAtmosphereSun: skyAtmosphereSun];
        MBXValue* skyAtmosphereSunIntensity = [MBXValue constant: @15.0];
        [builder skyAtmosphereSunIntensity: skyAtmosphereSunIntensity];
    }
                      onError:nil];
    
    // Re-use terrain source for hillshade
    NSDictionary* properties = @{
        @"id": @"terrain_hillshade",
        @"type": @"hillshade",
        @"source": @"mapbox-dem",
        @"hillshade-illumination-anchor": @"map"
    };

    [self.mapView addLayerBelowWithProperties:properties layerId:@"water" onError:nil];
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

@end

@implementation SceneKitExampleCustomLayerHost

- (instancetype)initWithModelOrigin: (CLLocationCoordinate2D) modelOrigin
            renderingWillEndHandler: (RenderingWillEndHandler) renderingWillEndHandler {
    self = [super init];
    
    _modelOrigin = modelOrigin;
    _renderingWillEndHandler = renderingWillEndHandler;
    
    return self;
}

- (void)renderingWillStart:(id<MTLDevice>)metalDevice colorPixelFormat:(NSUInteger)colorPixelFormat depthStencilPixelFormat:(NSUInteger)depthStencilPixelFormat {
    self.renderer = [SCNRenderer rendererWithDevice:metalDevice
                                            options:nil];
    self.scene = [SCNScene new];
    self.renderer.scene = self.scene;
    
    self.modelNode = [[SCNScene sceneNamed:@"34M_17"].rootNode clone];
    [self.scene.rootNode addChildNode: self.modelNode];
    
    self.cameraNode = [SCNNode new];
    
    SCNCamera* camera = [SCNCamera new];
    self.cameraNode.camera = camera;
    camera.usesOrthographicProjection = false;
    [self.scene.rootNode addChildNode:self.cameraNode];
    self.renderer.pointOfView = camera;
    
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
    matrix_identity_double4x4 matrix;
        
    matrix[3][0] = x;
    matrix[3][1] = y;
    matrix[3][2] = z;
    
    return matrix;
}

@end
    func makeTranslationMatrix(tx: Double, ty: Double, tz: Double) -> simd_double4x4 {
        var matrix = matrix_identity_double4x4

        matrix[3, 0] = tx
        matrix[3, 1] = ty
        matrix[3, 2] = tz

        return matrix
    }

    func makeScaleMatrix(xScale: Double, yScale: Double, zScale: Double) -> simd_double4x4 {
        var matrix = matrix_identity_double4x4

        matrix[0, 0] = xScale
        matrix[1, 1] = yScale
        matrix[2, 2] = zScale

        return matrix
    }

    func render(_ parameters: CustomLayerRenderParameters, mtlCommandBuffer: MTLCommandBuffer, mtlRenderPassDescriptor: MTLRenderPassDescriptor) {
        guard let colorTexture = mtlRenderPassDescriptor.colorAttachments[0].texture else {
            return
        }
        let m = parameters.projectionMatrix

        // It is essential to use double precision for computation below: using simd instead
        // of SceneKit matrix operations.
        var transformSimd = matrix_identity_double4x4
        transformSimd[0, 0] = m[0].doubleValue
        transformSimd[0, 1] = m[1].doubleValue
        transformSimd[0, 2] = m[2].doubleValue
        transformSimd[0, 3] = m[3].doubleValue
        transformSimd[1, 0] = m[4].doubleValue
        transformSimd[1, 1] = m[5].doubleValue
        transformSimd[1, 2] = m[6].doubleValue
        transformSimd[1, 3] = m[7].doubleValue
        transformSimd[2, 0] = m[8].doubleValue
        transformSimd[2, 1] = m[9].doubleValue
        transformSimd[2, 2] = m[10].doubleValue
        transformSimd[2, 3] = m[11].doubleValue
        transformSimd[3, 0] = m[12].doubleValue
        transformSimd[3, 1] = m[13].doubleValue
        transformSimd[3, 2] = m[14].doubleValue
        transformSimd[3, 3] = m[15].doubleValue

        // Model is using metric unit system: scale x and y from meters to mercator and keep z is in meters.
        let meterInMercatorCoordinateUnits = 1.0 / (Projection.metersPerPoint(for: modelOrigin.latitude, zoom: CGFloat(parameters.zoom)))
        let modelScale = makeScaleMatrix(xScale: meterInMercatorCoordinateUnits, yScale: Double(-meterInMercatorCoordinateUnits), zScale: 1)

        // Translate scaled model to model origin (in web mercator coordinates) and elevate to model origin's altitude (in meters).
        let origin = Projection.project(modelOrigin, zoomScale: CGFloat(pow(2, parameters.zoom)))
        var elevation = 0.0
        if let elevationData = parameters.elevationData, let elevationValue = elevationData.getElevationFor(self.modelOrigin) {
            elevation = elevationValue.doubleValue
        }
        let translateModel = makeTranslationMatrix(tx: origin.x, ty: origin.y, tz: elevation)

        let transform = transformSimd * translateModel * modelScale

        let scnMat = SCNMatrix4(
            m11: Float(transform[0, 0]),
            m12: Float(transform[0, 1]),
            m13: Float(transform[0, 2]),
            m14: Float(transform[0, 3]),
            m21: Float(transform[1, 0]),
            m22: Float(transform[1, 1]),
            m23: Float(transform[1, 2]),
            m24: Float(transform[1, 3]),
            m31: Float(transform[2, 0]),
            m32: Float(transform[2, 1]),
            m33: Float(transform[2, 2]),
            m34: Float(transform[2, 3]),
            m41: Float(transform[3, 0]),
            m42: Float(transform[3, 1]),
            m43: Float(transform[3, 2]),
            m44: Float(transform[3, 3])
        )
        cameraNode.camera!.projectionTransform = scnMat

        // flush automatic SceneKit transaction as SceneKit animation is not running and
        // there's need to use transform matrix in this frame (not to have it used with delay).
        SCNTransaction.flush()

        if self.useCPUOcclusion {
            mtlRenderPassDescriptor.depthAttachment = nil
            mtlRenderPassDescriptor.stencilAttachment = nil
            // Example uses depth buffer to occlude model when e.g. behind the hill.
            // If depth buffer (SCNRenderer.usesReverseZ = false) is not available, or if wished to
            // to indicate that model is occluded or e.g. implement fade out / fade in model occlusion,
            // the example here needs to provide CPU side occlusion implementation, too.
            // TODO: this is blocked on https://github.com/mapbox/mapbox-maps-ios/issues/155
        }
        renderer.render(withViewport: CGRect(x: 0, y: 0, width: CGFloat(colorTexture.width), height: CGFloat(colorTexture.height)), commandBuffer: mtlCommandBuffer, passDescriptor: mtlRenderPassDescriptor)

    }

    func renderingWillEnd() {
        // The below line is used for internal testing purposes only.
        renderingWillEndHandler()
    }
}
