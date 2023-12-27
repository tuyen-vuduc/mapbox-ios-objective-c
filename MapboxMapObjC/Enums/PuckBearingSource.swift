import MapboxMaps

@objc public enum TMBPuckBearingSource : Int {
    case heading
    case course
}

extension TMBPuckBearingSource {
    func swiftOnly() -> PuckBearingSource {
        switch(self) {
        case .heading: return .heading
        case .course: return .course
        }
    }
}
