import MapboxMaps

@objc public enum MBXPuckBearingSource : Int {
    case heading
    case course
}

extension MBXPuckBearingSource {
    func swiftOnly() -> PuckBearingSource {
        switch(self) {
        case .heading: return .heading
        case .course: return .course
        }
    }
}
