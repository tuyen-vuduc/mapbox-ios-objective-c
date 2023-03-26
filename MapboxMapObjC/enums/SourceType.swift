@objc
public enum TMBSourceType : Int {
    /// A vector tile source.
    case vector

    /// A raster tile source.
    case raster

    /// A raster DEM source.
    case rasterDem

    /// A GeoJSON source.
    case geoJson

    /// An image source.
    case image

    /// A model source
    case model
}
