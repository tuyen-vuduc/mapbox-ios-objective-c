import MapboxMaps

/// Listens to ``HeadingProvider``'s updates.
@objc public protocol TMBHeadingObserver: AnyObject {
    func onHeadingUpdate(_ heading: TMBHeading)
}
extension TMBHeadingObserver {
    func unwrap() -> HeadingObserver {
        HeadingObserverAdapter(origin: self)
    }
}
extension HeadingObserver {
    func wrap() -> TMBHeadingObserver {
        TMBHeadingObserverAdapter(origin: self)
    }
}
internal class HeadingObserverAdapter : HeadingObserver {
    func onHeadingUpdate(_ heading: MapboxMaps.Heading) {
        self.origin.onHeadingUpdate(heading.wrap())
    }
    
    private let origin: TMBHeadingObserver
    public init(origin: TMBHeadingObserver) {
        self.origin = origin
    }
}
internal class TMBHeadingObserverAdapter : TMBHeadingObserver {
    func onHeadingUpdate(_ heading: TMBHeading) {
        self.origin.onHeadingUpdate(heading.unwrap())
    }
    
    private let origin: HeadingObserver
    public init(origin: HeadingObserver) {
        self.origin = origin
    }
}

/// Provides heading data to drive the location puck.
@objc public protocol TMBHeadingProvider {
    /// Latest observed heading.
    var latestHeading: TMBHeading? { get }

    /// Adds heading observer.
    func add(headingObserver: TMBHeadingObserver)

    /// Removes heading observer.
    func remove(headingObserver: TMBHeadingObserver)
}
extension TMBHeadingProvider {
    func unwrap() -> HeadingProvider {
        HeadingProviderAdapter(origin: self)
    }
}
extension HeadingProvider {
    func wrap() -> TMBHeadingProvider {
        TMBHeadingProviderAdapter(origin: self)
    }
}

internal class HeadingProviderAdapter : HeadingProvider {
    var latestHeading: MapboxMaps.Heading? {
        self.origin.latestHeading?.unwrap()
    }
    
    func add(headingObserver: MapboxMaps.HeadingObserver) {
        self.origin.add(headingObserver: headingObserver.wrap())
    }
    
    func remove(headingObserver: MapboxMaps.HeadingObserver) {
        self.origin.remove(headingObserver: headingObserver.wrap())
    }
    
    private let origin: TMBHeadingProvider
    public init(origin: TMBHeadingProvider) {
        self.origin = origin
    }
}

internal class LocationHeadingProviderAdapter : LocationProvider, HeadingProvider {
    func addLocationObserver(for observer: LocationObserver) {
        origin.addLocationObserver(for: observer)
    }
    
    func removeLocationObserver(for observer: LocationObserver) {
        origin.removeLocationObserver(for: observer)
    }
    
    func getLastObservedLocation() -> Location? {
        origin.getLastObservedLocation()
    }
    
    var latestHeading: MapboxMaps.Heading? {
        self.origin.latestHeading?.unwrap()
    }
    
    func add(headingObserver: MapboxMaps.HeadingObserver) {
        self.origin.add(headingObserver: headingObserver.wrap())
    }
    
    func remove(headingObserver: MapboxMaps.HeadingObserver) {
        self.origin.remove(headingObserver: headingObserver.wrap())
    }
    
    private let origin: LocationProvider & TMBHeadingProvider
    public init(origin: LocationProvider & TMBHeadingProvider) {
        self.origin = origin
    }
}

internal class TMBHeadingProviderAdapter : TMBHeadingProvider {
    var latestHeading: TMBHeading? {
        self.origin.latestHeading?.wrap()
    }
    
    func add(headingObserver: TMBHeadingObserver) {
        self.origin.add(headingObserver: headingObserver.unwrap())
    }
    
    func remove(headingObserver: TMBHeadingObserver) {
        self.origin.remove(headingObserver: headingObserver.unwrap())
    }
    
    private let origin: HeadingProvider
    public init(origin: HeadingProvider) {
        self.origin = origin
    }
}
