//
//  TMBViewportStatus.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 7/18/24.
//

import Foundation
import MapboxMaps

/// `ViewportStatus` contains 3 cases that express what the ``ViewportManager`` is doing at any given time.
///
/// The ``ViewportStatus/state(_:)`` and ``ViewportStatus/transition(_:toState:)``
/// cases have associated values that are reference types, so equality and hash are implemented in terms of
/// the identities of those objects.
@objc public class TMBViewportStatus: NSObject {

    /// The `idle` status indicates that ``ViewportManager`` is inactive.
    @objc public let idle: Bool
    @objc public let state: TMBViewportState?
    @objc public let transition: TMBViewportTransition?
    
    private init(idle: Bool, state: TMBViewportState?, transition: TMBViewportTransition?) {
        self.idle = idle
        self.state = state
        self.transition = transition
    }
    
    @objc public static let idleInstance = TMBViewportStatus(idle: true, state: nil, transition: nil)
    
    /// The `state(_:)` status indicates that ``ViewportManager`` is running the associated value `state`.
    @objc public static func fromState(_ state: TMBViewportState) -> TMBViewportStatus {
        TMBViewportStatus(idle: false, state: state, transition: nil)
    }
    
    /// The `transition(_:toState:)` status indicates that ``ViewportManager`` is running `transition`
    /// and will start running `toState` upon success.
    @objc public static func fromTransition(_ transition: TMBViewportTransition, toState: TMBViewportState) -> TMBViewportStatus {
        TMBViewportStatus(idle: false, state: toState, transition: transition)
    }
}

extension ViewportStatus {
    func wrap() -> TMBViewportStatus {
        switch self {
        case .idle:
            return TMBViewportStatus.idleInstance
        case .state(let state):
            return TMBViewportStatus.fromState(try! state.wrap())
        case .transition(let transition, let toState):
            return TMBViewportStatus.fromTransition(transition.wrap(), toState: try! toState.wrap())
        }
    }
}

extension ViewportState {
    func wrap() throws -> TMBViewportState {
        print("ViewportState::\(String(describing: type(of: self)))")
        
        if let overview = self as? OverviewViewportState {
            return overview.wrap()
        }
        if let follow = self as? FollowPuckViewportState {
            return follow.wrap()
        }
        
        throw ViewportStateError.notSupported(String(describing: type(of: self)))
    }
}

enum ViewportStateError: Error {
    case notSupported(String)
}
