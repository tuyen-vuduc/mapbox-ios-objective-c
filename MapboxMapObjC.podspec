Pod::Spec.new do |s|  
    maps_version = '11.0.0'

    s.name              = 'MapboxMapObjC'
    s.version           = maps_version
    s.summary           = 'Utility extensions to use Mapbox in Objective-C'
    s.homepage          = 'https://github.com/tuyen-vuduc/mapbox-ios-objective-c'
    s.social_media_url = 'https://twitter.com/tuyen_vuduc'
    s.documentation_url = 'https://docs.mapbox.com/ios/maps/api-reference/'

    s.author            = { 'Tuyen Vu' => 'hi@tuyen-vuduc.tech' }
    s.license = { :type => "MIT", :text => "MIT License" }

    s.platform          = :ios
    s.ios.deployment_target = '14.0'
    s.swift_version = '5.8'
    # change the source location
    s.source = { :git => 'https://github.com/tuyen-vuduc/mapbox-ios-objective-c.git', :tag => "v#{maps_version}" }

    s.source_files = 'MapboxMapObjC/**/*.{swift,h}'

    s.dependency 'MapboxMaps', maps_version
end 