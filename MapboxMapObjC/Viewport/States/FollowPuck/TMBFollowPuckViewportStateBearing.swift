//
//  TMBFollowPuckViewportStateBearing.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import CoreLocation
import MapboxMaps

/// Expresses the different ways that ``FollowPuckViewportState`` can obtain values to use when
/// setting ``CameraOptions-swift.struct/bearing``.
///
/// - SeeAlso: ``LocationOptions/puckBearing``
@objc public class TMBFollowPuckViewportStateBearing: NSObject {
    @objc public let bearing: CLLocationDirection
    @objc public let heading: Bool
    @objc public let course: Bool
    
    private init(bearing: CLLocationDirection, heading: Bool, course: Bool) {
        self.bearing = bearing
        self.heading = heading
        self.course = course
    }
    
    /// ``FollowPuckViewportState`` sets ``CameraOptions-swift.struct/bearing`` to a constant value.
    ///
    /// - Parameter bearing: the constant value that should be used to set the camera bearing.
    @objc public static func FromConstant(_ bearing: CLLocationDirection) -> TMBFollowPuckViewportStateBearing {
        TMBFollowPuckViewportStateBearing(bearing: bearing, heading: false, course: false)
    }

    /// ``FollowPuckViewportState`` sets ``CameraOptions-swift.struct/bearing`` based on the current
    /// heading.
    ///
    /// - SeeAlso:
    ///   - ``LocationManager``
    ///   - ``Location/heading``
    @objc public static let heading = TMBFollowPuckViewportStateBearing(bearing: 0, heading: true, course: false)

    /// ``FollowPuckViewportState`` sets ``CameraOptions-swift.struct/bearing`` based on the current
    /// course.
    ///
    /// - SeeAlso:
    ///   - ``LocationManager``
    ///   - ``Location/course``
    @objc public static let course = TMBFollowPuckViewportStateBearing(bearing: 0, heading: false, course: true)
}

extension TMBFollowPuckViewportStateBearing {
    func unwrap() -> FollowPuckViewportStateBearing {
        if self.heading {
            return .heading
        }
        
        if self.course {
            return .course
        }
        
        return .constant(self.bearing)
    }
}

extension FollowPuckViewportStateBearing {
    func wrap() -> TMBFollowPuckViewportStateBearing {
        switch self {
        case .constant(let bearing):
            return TMBFollowPuckViewportStateBearing.FromConstant(bearing)
        case .course:
            return TMBFollowPuckViewportStateBearing.course
        case .heading:
            return TMBFollowPuckViewportStateBearing.heading
        }
    }
}
