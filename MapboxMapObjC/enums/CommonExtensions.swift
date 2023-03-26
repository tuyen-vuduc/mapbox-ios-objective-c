import MapboxMaps

extension NSNumber {
    func visibility() -> Visibility? {
        let visibility = TMBVisibility(rawValue: intValue)
        return visibility?.swiftOnly()
    }
    func lineCap() -> LineCap? {
        let lineCap = TMBLineCap(rawValue: intValue)
        return lineCap?.swiftOnly()
    }
    func lineJoin() -> LineJoin? {
        let lineJoin = TMBLineJoin(rawValue: intValue)
        return lineJoin?.swiftOnly()
    }
    func iconAnchor() -> IconAnchor? {
        let iconAnchor = TMBIconAnchor(rawValue: intValue)
        return iconAnchor?.swiftOnly()
    }
    func iconPitchAlignment() -> IconPitchAlignment? {
        let iconPitchAlignment = TMBIconPitchAlignment(rawValue: intValue)
        return iconPitchAlignment?.swiftOnly()
    }
    func iconRotationAlignment() -> IconRotationAlignment? {
        let iconRotationAlignment = TMBIconRotationAlignment(rawValue: intValue)
        return iconRotationAlignment?.swiftOnly()
    }
    func iconTextFit() -> IconTextFit? {
        let iconTextFit = TMBIconTextFit(rawValue: intValue)
        return iconTextFit?.swiftOnly()
    }
    func symbolPlacement() -> SymbolPlacement? {
        let symbolPlacement = TMBSymbolPlacement(rawValue: intValue)
        return symbolPlacement?.swiftOnly()
    }
    func symbolZOrder() -> SymbolZOrder? {
        let symbolZOrder = TMBSymbolZOrder(rawValue: intValue)
        return symbolZOrder?.swiftOnly()
    }
    func textAnchor() -> TextAnchor? {
        let textAnchor = TMBTextAnchor(rawValue: intValue)
        return textAnchor?.swiftOnly()
    }
    func textJustify() -> TextJustify? {
        let textJustify = TMBTextJustify(rawValue: intValue)
        return textJustify?.swiftOnly()
    }
    func textPitchAlignment() -> TextPitchAlignment? {
        let textPitchAlignment = TMBTextPitchAlignment(rawValue: intValue)
        return textPitchAlignment?.swiftOnly()
    }
    func textRotationAlignment() -> TextRotationAlignment? {
        let textRotationAlignment = TMBTextRotationAlignment(rawValue: intValue)
        return textRotationAlignment?.swiftOnly()
    }
    func textTransform() -> TextTransform? {
        let textTransform = TMBTextTransform(rawValue: intValue)
        return textTransform?.swiftOnly()
    }
    func fillTranslateAnchor() -> FillTranslateAnchor? {
        let fillTranslateAnchor = TMBFillTranslateAnchor(rawValue: intValue)
        return fillTranslateAnchor?.swiftOnly()
    }
    func lineTranslateAnchor() -> LineTranslateAnchor? {
        let lineTranslateAnchor = TMBLineTranslateAnchor(rawValue: intValue)
        return lineTranslateAnchor?.swiftOnly()
    }
    func iconTranslateAnchor() -> IconTranslateAnchor? {
        let iconTranslateAnchor = TMBIconTranslateAnchor(rawValue: intValue)
        return iconTranslateAnchor?.swiftOnly()
    }
    func textTranslateAnchor() -> TextTranslateAnchor? {
        let textTranslateAnchor = TMBTextTranslateAnchor(rawValue: intValue)
        return textTranslateAnchor?.swiftOnly()
    }
    func circlePitchAlignment() -> CirclePitchAlignment? {
        let circlePitchAlignment = TTMBirclePitchAlignment(rawValue: intValue)
        return circlePitchAlignment?.swiftOnly()
    }
    func circlePitchScale() -> CirclePitchScale? {
        let circlePitchScale = TTMBirclePitchScale(rawValue: intValue)
        return circlePitchScale?.swiftOnly()
    }
    func circleTranslateAnchor() -> CircleTranslateAnchor? {
        let circleTranslateAnchor = TTMBircleTranslateAnchor(rawValue: intValue)
        return circleTranslateAnchor?.swiftOnly()
    }
    func fillExtrusionTranslateAnchor() -> FillExtrusionTranslateAnchor? {
        let fillExtrusionTranslateAnchor = TMBFillExtrusionTranslateAnchor(rawValue: intValue)
        return fillExtrusionTranslateAnchor?.swiftOnly()
    }
    func rasterResampling() -> RasterResampling? {
        let rasterResampling = TMBRasterResampling(rawValue: intValue)
        return rasterResampling?.swiftOnly()
    }
    func hillshadeIlluminationAnchor() -> HillshadeIlluminationAnchor? {
        let hillshadeIlluminationAnchor = TMBHillshadeIlluminationAnchor(rawValue: intValue)
        return hillshadeIlluminationAnchor?.swiftOnly()
    }
    func skyType() -> SkyType? {
        let skyType = TMBSkyType(rawValue: intValue)
        return skyType?.swiftOnly()
    }
    func anchor() -> Anchor? {
        let anchor = TMBAnchor(rawValue: intValue)
        return anchor?.swiftOnly()
    }
    func styleProjectionName() -> StyleProjectionName? {
        let styleProjectionName = TMBStyleProjectionName(rawValue: intValue)
        return styleProjectionName?.swiftOnly()
    }
    func textWritingMode() -> TextWritingMode? {
        let textWritingMode = TMBTextWritingMode(rawValue: intValue)
        return textWritingMode?.swiftOnly()
    }
}

extension TMBVisibility {
    func swiftOnly() -> Visibility? {
        return visibilityMapping[self]
    }
}

extension TMBLineCap {
    func swiftOnly() -> LineCap? {
        return lineCapMapping[self]
    }
}
extension TMBLineJoin {
    func swiftOnly() -> LineJoin? {
        return lineJoinMapping[self]
    }
}
extension TMBIconAnchor {
    func swiftOnly() -> IconAnchor? {
        return iconAnchorMapping[self]
    }
}
extension TMBIconPitchAlignment {
    func swiftOnly() -> IconPitchAlignment? {
        return iconPitchAlignmentMapping[self]
    }
}
extension TMBIconRotationAlignment {
    func swiftOnly() -> IconRotationAlignment? {
        return iconRotationAlignmentMapping[self]
    }
}
extension TMBIconTextFit {
    func swiftOnly() -> IconTextFit? {
        return iconTextFitMapping[self]
    }
}
extension TMBSymbolPlacement {
    func swiftOnly() -> SymbolPlacement? {
        return symbolPlacementMapping[self]
    }
}
extension TMBSymbolZOrder {
    func swiftOnly() -> SymbolZOrder? {
        return symbolZOrderMapping[self]
    }
}
extension TMBTextAnchor {
    func swiftOnly() -> TextAnchor? {
        return textAnchorMapping[self]
    }
}
extension TMBTextJustify {
    func swiftOnly() -> TextJustify? {
        return textJustifyMapping[self]
    }
}
extension TMBTextPitchAlignment {
    func swiftOnly() -> TextPitchAlignment? {
        return textPitchAlignmentMapping[self]
    }
}
extension TMBTextRotationAlignment {
    func swiftOnly() -> TextRotationAlignment? {
        return textRotationAlignmentMapping[self]
    }
}
extension TMBTextTransform {
    func swiftOnly() -> TextTransform? {
        return textTransformMapping[self]
    }
}
extension TMBFillTranslateAnchor {
    func swiftOnly() -> FillTranslateAnchor? {
        return fillTranslateAnchorMapping[self]
    }
}
extension TMBLineTranslateAnchor {
    func swiftOnly() -> LineTranslateAnchor? {
        return lineTranslateAnchorMapping[self]
    }
}
extension TMBIconTranslateAnchor {
    func swiftOnly() -> IconTranslateAnchor? {
        return iconTranslateAnchorMapping[self]
    }
}
extension TMBTextTranslateAnchor {
    func swiftOnly() -> TextTranslateAnchor? {
        return textTranslateAnchorMapping[self]
    }
}
extension TTMBirclePitchAlignment {
    func swiftOnly() -> CirclePitchAlignment? {
        return circlePitchAlignmentMapping[self]
    }
}
extension TTMBirclePitchScale {
    func swiftOnly() -> CirclePitchScale? {
        return circlePitchScaleMapping[self]
    }
}
extension TTMBircleTranslateAnchor {
    func swiftOnly() -> CircleTranslateAnchor? {
        return circleTranslateAnchorMapping[self]
    }
}
extension TMBFillExtrusionTranslateAnchor {
    func swiftOnly() -> FillExtrusionTranslateAnchor? {
        return fillExtrusionTranslateAnchorMapping[self]
    }
}
extension TMBRasterResampling {
    func swiftOnly() -> RasterResampling? {
        return rasterResamplingMapping[self]
    }
}
extension TMBHillshadeIlluminationAnchor {
    func swiftOnly() -> HillshadeIlluminationAnchor? {
        return hillshadeIlluminationAnchorMapping[self]
    }
}
extension TMBSkyType {
    func swiftOnly() -> SkyType? {
        return skyTypeMapping[self]
    }
}
extension TMBAnchor {
    func swiftOnly() -> Anchor? {
        return anchorMapping[self]
    }
}
extension TMBStyleProjectionName {
    func swiftOnly() -> StyleProjectionName? {
        return styleProjectionNameMapping[self]
    }
}
extension TMBTextWritingMode {
    func swiftOnly() -> TextWritingMode? {
        return textWritingModeMapping[self]
    }
}
