//
//  TMBViewportOptions.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import MapboxMaps

/// Configuration options for ``ViewportManager``.
@objc public class TMBViewportOptions: NSObject {
    /// Indicates whether the ``ViewportManager`` should idle when the ``MapView``
    /// receives pan touch input.
    ///
    /// Set this property to `false` to enable building custom ``ViewportState``s that
    /// can work simultaneously with certain types of gestures.
    ///
    /// Defaults to `true`.
    @objc public var transitionsToIdleUponUserInteraction: Bool

    /// Creates viewport options
    /// - Parameters:
    ///     - transitionsToIdleUponUserInteraction: If `true`, viewport will idle when map receives pan gesture. Default value is `true`.
    @objc public init(transitionsToIdleUponUserInteraction: Bool = true) {
        self.transitionsToIdleUponUserInteraction = transitionsToIdleUponUserInteraction
    }
}

extension TMBViewportOptions {
    func unwrap() -> ViewportOptions {
        ViewportOptions(transitionsToIdleUponUserInteraction: self.transitionsToIdleUponUserInteraction)
    }
}

extension ViewportOptions {
    func wrap() -> TMBViewportOptions {
        TMBViewportOptions(transitionsToIdleUponUserInteraction: self.transitionsToIdleUponUserInteraction)
    }
}
