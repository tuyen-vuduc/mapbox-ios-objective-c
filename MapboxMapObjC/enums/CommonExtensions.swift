import MapboxMaps

extension NSNumber {
    func visibility() -> Visibility? {
        let visibility = MBXVisibility(rawValue: intValue)
        return visibility?.swiftOnly()
    }
    func lineCap() -> LineCap? {
        let lineCap = MBXLineCap(rawValue: intValue)
        return lineCap?.swiftOnly()
    }
    func lineJoin() -> LineJoin? {
        let lineJoin = MBXLineJoin(rawValue: intValue)
        return lineJoin?.swiftOnly()
    }
    func iconAnchor() -> IconAnchor? {
        let iconAnchor = MBXIconAnchor(rawValue: intValue)
        return iconAnchor?.swiftOnly()
    }
    func iconPitchAlignment() -> IconPitchAlignment? {
        let iconPitchAlignment = MBXIconPitchAlignment(rawValue: intValue)
        return iconPitchAlignment?.swiftOnly()
    }
    func iconRotationAlignment() -> IconRotationAlignment? {
        let iconRotationAlignment = MBXIconRotationAlignment(rawValue: intValue)
        return iconRotationAlignment?.swiftOnly()
    }
    func iconTextFit() -> IconTextFit? {
        let iconTextFit = MBXIconTextFit(rawValue: intValue)
        return iconTextFit?.swiftOnly()
    }
    func symbolPlacement() -> SymbolPlacement? {
        let symbolPlacement = MBXSymbolPlacement(rawValue: intValue)
        return symbolPlacement?.swiftOnly()
    }
    func symbolZOrder() -> SymbolZOrder? {
        let symbolZOrder = MBXSymbolZOrder(rawValue: intValue)
        return symbolZOrder?.swiftOnly()
    }
    func textAnchor() -> TextAnchor? {
        let textAnchor = MBXTextAnchor(rawValue: intValue)
        return textAnchor?.swiftOnly()
    }
    func textJustify() -> TextJustify? {
        let textJustify = MBXTextJustify(rawValue: intValue)
        return textJustify?.swiftOnly()
    }
    func textPitchAlignment() -> TextPitchAlignment? {
        let textPitchAlignment = MBXTextPitchAlignment(rawValue: intValue)
        return textPitchAlignment?.swiftOnly()
    }
    func textRotationAlignment() -> TextRotationAlignment? {
        let textRotationAlignment = MBXTextRotationAlignment(rawValue: intValue)
        return textRotationAlignment?.swiftOnly()
    }
    func textTransform() -> TextTransform? {
        let textTransform = MBXTextTransform(rawValue: intValue)
        return textTransform?.swiftOnly()
    }
    func fillTranslateAnchor() -> FillTranslateAnchor? {
        let fillTranslateAnchor = MBXFillTranslateAnchor(rawValue: intValue)
        return fillTranslateAnchor?.swiftOnly()
    }
    func lineTranslateAnchor() -> LineTranslateAnchor? {
        let lineTranslateAnchor = MBXLineTranslateAnchor(rawValue: intValue)
        return lineTranslateAnchor?.swiftOnly()
    }
    func iconTranslateAnchor() -> IconTranslateAnchor? {
        let iconTranslateAnchor = MBXIconTranslateAnchor(rawValue: intValue)
        return iconTranslateAnchor?.swiftOnly()
    }
    func textTranslateAnchor() -> TextTranslateAnchor? {
        let textTranslateAnchor = MBXTextTranslateAnchor(rawValue: intValue)
        return textTranslateAnchor?.swiftOnly()
    }
    func circlePitchAlignment() -> CirclePitchAlignment? {
        let circlePitchAlignment = MBXCirclePitchAlignment(rawValue: intValue)
        return circlePitchAlignment?.swiftOnly()
    }
    func circlePitchScale() -> CirclePitchScale? {
        let circlePitchScale = MBXCirclePitchScale(rawValue: intValue)
        return circlePitchScale?.swiftOnly()
    }
    func circleTranslateAnchor() -> CircleTranslateAnchor? {
        let circleTranslateAnchor = MBXCircleTranslateAnchor(rawValue: intValue)
        return circleTranslateAnchor?.swiftOnly()
    }
    func fillExtrusionTranslateAnchor() -> FillExtrusionTranslateAnchor? {
        let fillExtrusionTranslateAnchor = MBXFillExtrusionTranslateAnchor(rawValue: intValue)
        return fillExtrusionTranslateAnchor?.swiftOnly()
    }
    func rasterResampling() -> RasterResampling? {
        let rasterResampling = MBXRasterResampling(rawValue: intValue)
        return rasterResampling?.swiftOnly()
    }
    func hillshadeIlluminationAnchor() -> HillshadeIlluminationAnchor? {
        let hillshadeIlluminationAnchor = MBXHillshadeIlluminationAnchor(rawValue: intValue)
        return hillshadeIlluminationAnchor?.swiftOnly()
    }
    func skyType() -> SkyType? {
        let skyType = MBXSkyType(rawValue: intValue)
        return skyType?.swiftOnly()
    }
    func anchor() -> Anchor? {
        let anchor = MBXAnchor(rawValue: intValue)
        return anchor?.swiftOnly()
    }
    func styleProjectionName() -> StyleProjectionName? {
        let styleProjectionName = MBXStyleProjectionName(rawValue: intValue)
        return styleProjectionName?.swiftOnly()
    }
    func textWritingMode() -> TextWritingMode? {
        let textWritingMode = MBXTextWritingMode(rawValue: intValue)
        return textWritingMode?.swiftOnly()
    }
}

extension MBXVisibility {
    func swiftOnly() -> Visibility? {
        return visibilityMapping[self]
    }
}

extension MBXLineCap {
    func swiftOnly() -> LineCap? {
        return lineCapMapping[self]
    }
}
extension MBXLineJoin {
    func swiftOnly() -> LineJoin? {
        return lineJoinMapping[self]
    }
}
extension MBXIconAnchor {
    func swiftOnly() -> IconAnchor? {
        return iconAnchorMapping[self]
    }
}
extension MBXIconPitchAlignment {
    func swiftOnly() -> IconPitchAlignment? {
        return iconPitchAlignmentMapping[self]
    }
}
extension MBXIconRotationAlignment {
    func swiftOnly() -> IconRotationAlignment? {
        return iconRotationAlignmentMapping[self]
    }
}
extension MBXIconTextFit {
    func swiftOnly() -> IconTextFit? {
        return iconTextFitMapping[self]
    }
}
extension MBXSymbolPlacement {
    func swiftOnly() -> SymbolPlacement? {
        return symbolPlacementMapping[self]
    }
}
extension MBXSymbolZOrder {
    func swiftOnly() -> SymbolZOrder? {
        return symbolZOrderMapping[self]
    }
}
extension MBXTextAnchor {
    func swiftOnly() -> TextAnchor? {
        return textAnchorMapping[self]
    }
}
extension MBXTextJustify {
    func swiftOnly() -> TextJustify? {
        return textJustifyMapping[self]
    }
}
extension MBXTextPitchAlignment {
    func swiftOnly() -> TextPitchAlignment? {
        return textPitchAlignmentMapping[self]
    }
}
extension MBXTextRotationAlignment {
    func swiftOnly() -> TextRotationAlignment? {
        return textRotationAlignmentMapping[self]
    }
}
extension MBXTextTransform {
    func swiftOnly() -> TextTransform? {
        return textTransformMapping[self]
    }
}
extension MBXFillTranslateAnchor {
    func swiftOnly() -> FillTranslateAnchor? {
        return fillTranslateAnchorMapping[self]
    }
}
extension MBXLineTranslateAnchor {
    func swiftOnly() -> LineTranslateAnchor? {
        return lineTranslateAnchorMapping[self]
    }
}
extension MBXIconTranslateAnchor {
    func swiftOnly() -> IconTranslateAnchor? {
        return iconTranslateAnchorMapping[self]
    }
}
extension MBXTextTranslateAnchor {
    func swiftOnly() -> TextTranslateAnchor? {
        return textTranslateAnchorMapping[self]
    }
}
extension MBXCirclePitchAlignment {
    func swiftOnly() -> CirclePitchAlignment? {
        return circlePitchAlignmentMapping[self]
    }
}
extension MBXCirclePitchScale {
    func swiftOnly() -> CirclePitchScale? {
        return circlePitchScaleMapping[self]
    }
}
extension MBXCircleTranslateAnchor {
    func swiftOnly() -> CircleTranslateAnchor? {
        return circleTranslateAnchorMapping[self]
    }
}
extension MBXFillExtrusionTranslateAnchor {
    func swiftOnly() -> FillExtrusionTranslateAnchor? {
        return fillExtrusionTranslateAnchorMapping[self]
    }
}
extension MBXRasterResampling {
    func swiftOnly() -> RasterResampling? {
        return rasterResamplingMapping[self]
    }
}
extension MBXHillshadeIlluminationAnchor {
    func swiftOnly() -> HillshadeIlluminationAnchor? {
        return hillshadeIlluminationAnchorMapping[self]
    }
}
extension MBXSkyType {
    func swiftOnly() -> SkyType? {
        return skyTypeMapping[self]
    }
}
extension MBXAnchor {
    func swiftOnly() -> Anchor? {
        return anchorMapping[self]
    }
}
extension MBXStyleProjectionName {
    func swiftOnly() -> StyleProjectionName? {
        return styleProjectionNameMapping[self]
    }
}
extension MBXTextWritingMode {
    func swiftOnly() -> TextWritingMode? {
        return textWritingModeMapping[self]
    }
}
