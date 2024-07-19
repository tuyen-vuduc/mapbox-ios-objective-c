//
//  TMBDefaultViewportTransition.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/19/24.
//

import Foundation
import MapboxMaps

/// A default ``ViewportTransition`` implementation.
///
/// Use ``ViewportManager/makeDefaultViewportTransition(options:)`` to create instances of this
/// class.
@objc public final class TMBDefaultViewportTransition: NSObject {

    /// Configuration options.
    ///
    /// New values will take effect the next time ``ViewportTransition/run(to:completion:)``
    /// is invoked
    @objc public var options: TMBDefaultViewportTransitionOptions {
        get {
            self.origin.options.wrap()
        }
        set {
            self.origin.options = newValue.unwrap()
        }
    }

    private var origin: DefaultViewportTransition
    
    init(_ origin: DefaultViewportTransition) {
        self.origin = origin
    }
}

extension TMBDefaultViewportTransition {
    func unwrap() -> DefaultViewportTransition {
        self.origin
    }
}
extension DefaultViewportTransition {
    func wrap() -> TMBDefaultViewportTransition {
        TMBDefaultViewportTransition(self)
    }
}
