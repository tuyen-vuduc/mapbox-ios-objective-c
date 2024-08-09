# https://stackoverflow.com/questions/64645642/xcframework-with-pods-dependencies
rm -rf .build

xcodebuild archive \
    -workspace "mapboxqs.xcworkspace" \
    -scheme MapboxMapObjC \
    -archivePath ./.build/MapboxMapObjC-iphonesimulator.xcarchive \
    -sdk iphonesimulator \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

 xcodebuild archive \
    -workspace "mapboxqs.xcworkspace" \
    -scheme MapboxMapObjC \
    -archivePath ./.build/MapboxMapObjC-iphoneos.xcarchive \
    -sdk iphoneos \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -framework ./.build/MapboxMapObjC-iphonesimulator.xcarchive/Products/Library/Frameworks/MapboxMapObjC.framework \
    -framework ./.build/MapboxMapObjC-iphoneos.xcarchive/Products/Library/Frameworks/MapboxMapObjC.framework \
    -output ./.build/MapboxMapObjC.xcframework