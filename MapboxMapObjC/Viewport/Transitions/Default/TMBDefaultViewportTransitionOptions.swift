//
//  TMBDefaultViewportTransitionOptions.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/19/24.
//

import Foundation
import MapboxMaps

/// Configuration options for ``DefaultViewportTransition``.
@objc public class TMBDefaultViewportTransitionOptions: NSObject {

    /// The maximum duration of the transition.
    @objc public var maxDuration: TimeInterval

    /// Memberwise initializer for `DefaultViewportTransitionOptions`.
    /// - Parameter maxDuration: Defaults to 3.5.
    @objc public init(maxDuration: TimeInterval = 3.5) {
        self.maxDuration = maxDuration
    }
}

extension TMBDefaultViewportTransitionOptions {
    func unwrap() -> DefaultViewportTransitionOptions {
        DefaultViewportTransitionOptions(maxDuration: self.maxDuration)
    }
}
extension DefaultViewportTransitionOptions {
    func wrap() -> TMBDefaultViewportTransitionOptions {
        TMBDefaultViewportTransitionOptions(maxDuration: self.maxDuration)
    }
}
