//
//  AnnotationManager.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 25/03/2023.
//

import Foundation
import MapboxMaps

@objc
public protocol TMBAnnotationManager: AnyObject {
    /// The id of this annotation manager.
    var id: String { get }

    /// The id of the `GeoJSONSource` that this manager is responsible for.
    var sourceId: String { get }

    /// The id of the layer that this manager is responsible for.
    var layerId: String { get }
    
    /// Slot for the underlying layer.
    ///
    /// Use this property to position the annotations relative to other map features if you use Mapbox Standard Style.
    /// See <doc:Migrate-to-v11##21-The-Mapbox-Standard-Style> for more info.
    var slot: String? { get set }
}

/// A delegate that is called when a tap is detected on an annotation (or on several of them).
@objc
public protocol TMBAnnotationInteractionDelegate: AnyObject {

    /// This method is invoked when a tap gesture is detected on an annotation
    /// - Parameters:
    ///   - manager: The `AnnotationManager` that detected this tap gesture
    ///   - annotations: A list of `Annotations` that were tapped
    func annotationManager(
        _ manager: TMBAnnotationManager,
        didDetectTappedAnnotations annotations: [TMBAnnotation])

}
