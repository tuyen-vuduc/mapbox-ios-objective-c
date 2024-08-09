import UIKit
import Turf
import MapboxMaps
import MapboxCommon


/// Stores layout and visibility settings for a view annotation.
///
/// - Important: `ViewAnnotationOptions` is deprecated and will be removed in future releases. Use ``ViewAnnotation`` instead.
@objc open class TMBViewAnnotationOptions: NSObject {
    @objc public var annotatedFeature: TMBAnnotatedFeature?

    /// View annotation width in pixels.
    @objc public var width: NSNumber?

    /// View annotation height in pixels.
    @objc public var height: NSNumber?

    /// If true, the annotation will be visible even if it collides with other previously drawn annotations.
    /// If allowOverlap is null, default value `false` will be applied.
    /// Note: When the value is true, the ordering of the views are determined by the order of their addition.
    @objc public var allowOverlap: NSNumber?

    /// When `false`, the annotation won't be shown on top of the Puck.
    @objc public var allowOverlapWithPuck: NSNumber?

    /// Specifies if this view annotation is visible or not.
    ///
    /// Note: If this property is not specified explicitly when creating / updating view annotation, visibility will be
    /// handled automatically based on the `ViewAnnotation` view's visibility e.g. if actual view is set to be not visible the SDK
    /// will automatically update view annotation to have `visible = false`.
    ///
    /// If visible is null, default value `true` will be applied.
    @objc public var visible: NSNumber?

    @objc public var variableAnchors: [ViewAnnotationAnchorConfig]?

    /// Specifies if this view annotation is selected meaning it should be placed on top of others.
    /// If selected in null, default value `false` will be applied.
    @objc public var selected: NSNumber?

    /// When `false`, the annotation will be displayed even if it go beyond camera padding.
    @objc public var ignoreCameraPadding: NSNumber?

    /// Initializes a `ViewAnnotationOptions`
    @objc public init(
        annotatedFeature : TMBAnnotatedFeature?, 
        width : NSNumber?, 
        height : NSNumber?, 
        allowOverlap : NSNumber?, 
        allowOverlapWithPuck : NSNumber?, 
        visible : NSNumber?, 
        selected : NSNumber?, 
        variableAnchors : [ViewAnnotationAnchorConfig]?,
        ignoreCameraPadding : NSNumber?){
        self.annotatedFeature = annotatedFeature
        self.width = width
        self.height = height
        self.variableAnchors = variableAnchors
        self.allowOverlap = allowOverlap
        self.allowOverlapWithPuck = allowOverlapWithPuck
        self.visible = visible
        self.selected = selected
        self.ignoreCameraPadding = ignoreCameraPadding
    }
}
extension TMBViewAnnotationOptions {
    func unwrap() -> ViewAnnotationOptions {
        ViewAnnotationOptions(annotatedFeature: self.annotatedFeature?.unwrap(), width: self.width?.CGFloat, height: self.height?.CGFloat, allowOverlap: self.allowOverlap?.bool(), allowOverlapWithPuck: self.allowOverlapWithPuck?.bool(), visible: self.visible?.bool(), selected: self.selected?.bool(), variableAnchors: self.variableAnchors, ignoreCameraPadding: self.ignoreCameraPadding?.bool())
    }
}
extension ViewAnnotationOptions {
    func wrap() -> TMBViewAnnotationOptions {
        TMBViewAnnotationOptions(annotatedFeature: self.annotatedFeature?.wrap(), width: self.width?.NSNumber, height: self.height?.NSNumber, allowOverlap: self.allowOverlap?.bool(), allowOverlapWithPuck: self.allowOverlapWithPuck?.bool(), visible: self.visible?.bool(), selected: self.selected?.bool(), variableAnchors: self.variableAnchors, ignoreCameraPadding: self.ignoreCameraPadding?.bool())
    }
}
