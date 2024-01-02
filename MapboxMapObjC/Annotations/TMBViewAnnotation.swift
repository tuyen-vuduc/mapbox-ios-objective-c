import UIKit
import MapboxCoreMaps
import MapboxCommon
import MapboxMaps


/// Creates a view annotation.
///
/// Use view annotations if you need to display interactive UIView bound to
/// a geographical coordinate or map feature.
///
/// The view annotations are great for displaying unique interactive features. However, they may be suboptimal for large amounts of data and don't support clustering. For those cases use ``PointAnnotation`` or Runtime Styling API, for example, ``SymbolLayer`` with ``GeoJSONSource``.
///
///- Note: View Annotations appear above all content of MapView (e.g. layers, annotations, puck). If you need to display annotation between layers or below puck, use ``PointAnnotation``.
///
/// To display a view annotation configure a UIView, create `ViewAnnotation`, and add it to the view annotation manager:
///
/// ```swift
/// let view = CustomView()
/// view.icon = UIImage(named: "traffic-icon")
/// let annotation = ViewAnnotation(
///   coordinate: CLLocationCoordinate(latitude: 10, longitude: 10),
///   view: view)
/// mapView.viewAnnotations.add(annotation)
/// ```
///
/// The annotation can be displayed on a layer feature referenced by it's `layerId` and `featureId`:
/// ```swift
/// annotation.annotatedFeature = .layerFeature(layerId: "route-line", featureId: "sf-la")
/// ```
///
/// The view annotation automatically inserts and removes it's view into the view hierarchy and updates its `isHidden` property.
///
/// - Important: Don't set `UIView.isHidden` property to hide the annotation. Instead, use ``visible`` property.
///
/// When view content or layout is updated, use ``setNeedsUpdateSize()`` to update the the annotation size. It's safe to use it multiple times, only one update will be performed.
///
/// ```swift
/// view.hintText = "Less Traffic"
/// annotation.setNeedsUpdateSize() // Updates the annotation size.
/// ```
///
/// - Note: The `ViewAnnotation` uses `UIView.systemLayoutSizeFitting(_:)` to measure the view size. Make sure that your view returns the correct size (e.g. implemented using AutoLayout, or returns correct size from `UIView.sizeThatFits(_:)` when layout is manual).
///
/// To remove annotation when it's no longer needed, use ``remove()`` method.
@objc open class TMBViewAnnotation: NSObject {
    /// Annotation view.
    @objc public var view: UIView {            
        origin.view
    }

    /// Associates the view annotation with the feature geometry.
    ///
    /// The geometry may be any `Geometry` or a feature rendered on a specified layer.
    @objc public var annotatedFeature: TMBAnnotatedFeature  {            
        get {
            origin.annotatedFeature.wrap()
        }
        set {
            origin.annotatedFeature = newValue.unwrap()
        }
    }

    /// If true, the annotation will be visible even if it collides with other previously drawn annotations.
    ///
    /// The property is `false` by default.
    @objc public var allowOverlap: Bool  {            
        get {
            origin.allowOverlap
        }
        set {
            origin.allowOverlap = newValue
        }
    }

    /// When `false`, the annotation won't be shown on top of Puck.
    ///
    /// Default value is `false`.
    @objc public var allowOverlapWithPuck: Bool  {            
        get {
            origin.allowOverlapWithPuck
        }
        set {
            origin.allowOverlapWithPuck = newValue
        }
    }

    /// When `false`, the annotation will be displayed even if it go beyond camera padding.
    ///
    /// The camera padding is set via ``MapboxMap/setCamera(to:)``.
    ///
    /// Default value is `false`.
    @objc public var ignoreCameraPadding: Bool  {            
        get {
            origin.ignoreCameraPadding
        }
        set {
            origin.ignoreCameraPadding = newValue
        }
    }

    /// Specifies if this view annotation is visible or not.
    ///
    /// The property is `true` by default.
    @objc public var visible: Bool  {            
        get {
            origin.visible
        }
        set {
            origin.visible = newValue
        }
    }

    /// Specifies if this view annotation is selected meaning it should be placed on top of others.
    ///
    /// The property is `false` by default.
    @objc public var selected: Bool  {            
        get {
            origin.selected
        }
        set {
            origin.selected = newValue
        }
    }

    /// A list of anchor configurations available.
    ///
    /// The annotation will automatically pick the first best anchor position depending on position
    /// relative to other elements on the map.
    ///
    /// If not specified, the annotation will be placed in center.
    ///
    /// The ``onAnchorChanged`` is called when the effective position is updated:
    /// ```swift
    /// let view = CustomView()
    /// let annotation = ViewAnnotation(
    ///     annotatedFeature: .layerFeature(layerId: "route-line", featureId: "sf-la"),
    ///     view: view)
    ///
    /// // Allow top and bottom anchor directions.
    /// annotation.variableAnchors = [
    ///   ViewAnnotationAnchorConfig(anchor: .top),
    ///   ViewAnnotationAnchorConfig(anchor: .bottom)
    /// ]
    ///
    /// annotation.onAnchorChanged = { config in
    ///     // Update the view's anchor to the newly picked one.
    ///     view.anchor = config.anchor
    /// }
    /// ```
    @objc public var variableAnchors: [ViewAnnotationAnchorConfig] {
        get {
            origin.variableAnchors
        }
        set {
            origin.variableAnchors = newValue
        }
    }

    /// Called when visibility of annotation is changed.
    ///
    /// The annotation becomes hidden when it goes out of MapView's bounds or ``visible`` property is changed.
    ///
    /// The callback takes `true` when annotation is visible.
    @objc public var onVisibilityChanged: ((Bool) -> Void)? {
        origin.onVisibilityChanged
    }

    /// Called when ``anchorConfig`` is changed.
    ///
    /// See ``variableAnchors``.
    ///
    /// The callback takes the `anchorConfig` parameter which represents the selected anchor configuration.
    @objc public var onAnchorChanged: ((ViewAnnotationAnchorConfig) -> Void)? {
        origin.onAnchorChanged
    }

    /// Called when ``anchorCoordinate`` is changed.
    @objc public var onAnchorCoordinateChanged: ((CLLocationCoordinate2D) -> Void)? {
        origin.onAnchorCoordinateChanged
    }

    /// Called when view frame is changed.
    ///
    /// The callback takes the `frame` parameter.
    @objc public var onFrameChanged: ((CGRect) -> Void)? {
        origin.onFrameChanged
    }

    /// Currently selected anchor configuration.
    @objc public var anchorConfig: ViewAnnotationAnchorConfig? {
        origin.anchorConfig
    }

    /// The actual geographical coordinate used for positioning this annotation.
    @objc public var anchorCoordinate: NSValue? {
        origin.anchorCoordinate?.toValue()
    }
    
    /// Creates an annotation.
    ///
    /// - Parameters:
    ///  - annotatedFeature: The feature the annotation will be bound to. It may be a `Geometry`,
    ///   such as `Point`, `LineString`, `Polygon`, or a feature rendered on a layer.
    ///  - view: View to use as annotation.
    @objc static public func from(annotatedFeature: TMBAnnotatedFeature, view : UIView) -> TMBViewAnnotation {
        TMBViewAnnotation(origin: ViewAnnotation(annotatedFeature: annotatedFeature.unwrap(), view: view))
    }

    /// Creates an annotation at specified coordinate.
    ///
    /// - Parameters:
    ///  - coordinate: Geographical coordinate of the annotation.
    ///  - view: View to use as annotation.
    @objc public static func from(coordinate: CLLocationCoordinate2D, view : UIView) -> TMBViewAnnotation {
        TMBViewAnnotation(origin: ViewAnnotation(annotatedFeature: .geometry(Point(coordinate)), view: view))
    }

    /// Creates a view annotation on feature rendered on a layer.
    ///
    /// - Parameters:
    ///   - layerId: Layer identifier which renders the feature.
    ///   - featureId: Feature identifier. If not specified, the annotation will appear on any feature from that layer.
    ///   - content: The view to place on the map.
    @objc public static func from(layerId : String, featureId : String?, view : UIView) -> TMBViewAnnotation {
        TMBViewAnnotation(origin: ViewAnnotation(
            annotatedFeature: .layerFeature(layerId: layerId, featureId: featureId),
            view: view))
    }

    /// Removes view annotation.
    ///
    /// This method removes the view from its superview.
    @objc public func remove() {
        origin.remove()
    }

    /// Invalidates the current size of view annotation.
    ///
    /// Call this method when the managed view layout is updated. The annotation will be repositioned according to the new size in the next rendering call.
    @objc public func setNeedsUpdateSize() {
        origin.setNeedsUpdateSize()
    }    
    
    private let origin:ViewAnnotation
    init(origin: ViewAnnotation) {
        self.origin = origin
    }

}
extension TMBViewAnnotation {
    func unwrap() -> ViewAnnotation {
        self.origin
    }
}
extension ViewAnnotation {
    func wrap() -> TMBViewAnnotation {
        TMBViewAnnotation(origin: self)
    }
}
