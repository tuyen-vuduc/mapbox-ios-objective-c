// This file is generated.
import Foundation
import MapboxMaps

/// An icon or a text label.
///
/// - SeeAlso: [Mapbox Style Specification](https://www.mapbox.com/mapbox-gl-style-spec/#layers-symbol)
@objc open class TMBSymbolLayer: TMBLayer {
    private var _self: SymbolLayer
    
    @objc public init(id: String = UUID().uuidString) {
        self._self = SymbolLayer(id: id)
        super.init(self._self)
        
        self.visibility = TMBValue(constant: TMBVisibility.visible)
    }

    
    /// Whether this layer is displayed.
    @objc public var visibility : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.visibility)
        }
        set {
            _self.visibility = newValue?.visibility()
        }
    }

    /// If true, the icon will be visible even if it collides with other previously drawn symbols.
    @objc public var iconAllowOverlap : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconAllowOverlap)
        }
        set {
            _self.iconAllowOverlap = newValue?.boolean()
        }
    }

    /// Part of the icon placed closest to the anchor.
    @objc public var iconAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconAnchor)
        }
        set {
            _self.iconAnchor = newValue?.iconAnchor()
        }
    }

    /// If true, other symbols can be visible even if they collide with the icon.
    @objc public var iconIgnorePlacement : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconIgnorePlacement)
        }
        set {
            _self.iconIgnorePlacement = newValue?.boolean()
        }
    }

    /// Name of image in sprite to use for drawing an image background.
    @objc public var iconImage : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconImage)
        }
        set {
            _self.iconImage = newValue?.resolvedImage()
        }
    }

    /// If true, the icon may be flipped to prevent it from being rendered upside-down.
    @objc public var iconKeepUpright : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconKeepUpright)
        }
        set {
            _self.iconKeepUpright = newValue?.boolean()
        }
    }

    /// Offset distance of icon from its anchor. Positive values indicate right and down, while negative values indicate left and up. Each component is multiplied by the value of `icon-size` to obtain the final offset in pixels. When combined with `icon-rotate` the offset will be as if the rotated direction was up.
    @objc public var iconOffset : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconOffset)
        }
        set {
            _self.iconOffset = newValue?.arrayOfDouble()
        }
    }

    /// If true, text will display without their corresponding icons when the icon collides with other symbols and the text does not.
    @objc public var iconOptional : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconOptional)
        }
        set {
            _self.iconOptional = newValue?.boolean()
        }
    }

    /// Size of the additional area around the icon bounding box used for detecting symbol collisions.
    @objc public var iconPadding : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconPadding)
        }
        set {
            _self.iconPadding = newValue?.double()
        }
    }

    /// Orientation of icon when map is pitched.
    @objc public var iconPitchAlignment : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconPitchAlignment)
        }
        set {
            _self.iconPitchAlignment = newValue?.iconPitchAlignment()
        }
    }

    /// Rotates the icon clockwise.
    @objc public var iconRotate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconRotate)
        }
        set {
            _self.iconRotate = newValue?.double()
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of icons.
    @objc public var iconRotationAlignment : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconRotationAlignment)
        }
        set {
            _self.iconRotationAlignment = newValue?.iconRotationAlignment()
        }
    }

    /// Scales the original size of the icon by the provided factor. The new pixel size of the image will be the original pixel size multiplied by `icon-size`. 1 is the original size; 3 triples the size of the image.
    @objc public var iconSize : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconSize)
        }
        set {
            _self.iconSize = newValue?.double()
        }
    }

    /// Scales the icon to fit around the associated text.
    @objc public var iconTextFit : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconTextFit)
        }
        set {
            _self.iconTextFit = newValue?.iconTextFit()
        }
    }

    /// Size of the additional area added to dimensions determined by `icon-text-fit`, in clockwise order: top, right, bottom, left.
    @objc public var iconTextFitPadding : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconTextFitPadding)
        }
        set {
            _self.iconTextFitPadding = newValue?.arrayOfDouble()
        }
    }

    /// If true, the symbols will not cross tile edges to avoid mutual collisions. Recommended in layers that don't have enough padding in the vector tile to prevent collisions, or if it is a point symbol layer placed after a line symbol layer. When using a client that supports global collision detection, like Mapbox GL JS version 0.42.0 or greater, enabling this property is not needed to prevent clipped labels at tile boundaries.
    @objc public var symbolAvoidEdges : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.symbolAvoidEdges)
        }
        set {
            _self.symbolAvoidEdges = newValue?.boolean()
        }
    }

    /// Label placement relative to its geometry.
    @objc public var symbolPlacement : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.symbolPlacement)
        }
        set {
            _self.symbolPlacement = newValue?.symbolPlacement()
        }
    }

    /// Sorts features in ascending order based on this value. Features with lower sort keys are drawn and placed first.  When `icon-allow-overlap` or `text-allow-overlap` is `false`, features with a lower sort key will have priority during placement. When `icon-allow-overlap` or `text-allow-overlap` is set to `true`, features with a higher sort key will overlap over features with a lower sort key.
    @objc public var symbolSortKey : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.symbolSortKey)
        }
        set {
            _self.symbolSortKey = newValue?.double()
        }
    }

    /// Distance between two symbol anchors.
    @objc public var symbolSpacing : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.symbolSpacing)
        }
        set {
            _self.symbolSpacing = newValue?.double()
        }
    }

    /// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
    @objc public var symbolZOrder : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.symbolZOrder)
        }
        set {
            _self.symbolZOrder = newValue?.symbolZOrder()
        }
    }

    /// If true, the text will be visible even if it collides with other previously drawn symbols.
    @objc public var textAllowOverlap : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textAllowOverlap)
        }
        set {
            _self.textAllowOverlap = newValue?.boolean()
        }
    }

    /// Part of the text placed closest to the anchor.
    @objc public var textAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textAnchor)
        }
        set {
            _self.textAnchor = newValue?.textAnchor()
        }
    }

    /// Value to use for a text label. If a plain `string` is provided, it will be treated as a `formatted` with default/inherited formatting options. SDF images are not supported in formatted text and will be ignored.
    @objc public var textField : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textField)
        }
        set {
            _self.textField = newValue?.string()
        }
    }

    /// Font stack to use for displaying text.
    @objc public var textFont : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textFont)
        }
        set {
            _self.textFont = newValue?.arrayOfString()
        }
    }

    /// If true, other symbols can be visible even if they collide with the text.
    @objc public var textIgnorePlacement : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textIgnorePlacement)
        }
        set {
            _self.textIgnorePlacement = newValue?.boolean()
        }
    }

    /// Text justification options.
    @objc public var textJustify : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textJustify)
        }
        set {
            _self.textJustify = newValue?.textJustify()
        }
    }

    /// If true, the text may be flipped vertically to prevent it from being rendered upside-down.
    @objc public var textKeepUpright : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textKeepUpright)
        }
        set {
            _self.textKeepUpright = newValue?.boolean()
        }
    }

    /// Text tracking amount.
    @objc public var textLetterSpacing : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textLetterSpacing)
        }
        set {
            _self.textLetterSpacing = newValue?.double()
        }
    }

    /// Text leading value for multi-line text.
    @objc public var textLineHeight : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textLineHeight)
        }
        set {
            _self.textLineHeight = newValue?.double()
        }
    }

    /// Maximum angle change between adjacent characters.
    @objc public var textMaxAngle : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textMaxAngle)
        }
        set {
            _self.textMaxAngle = newValue?.double()
        }
    }

    /// The maximum line width for text wrapping.
    @objc public var textMaxWidth : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textMaxWidth)
        }
        set {
            _self.textMaxWidth = newValue?.double()
        }
    }

    /// Offset distance of text from its anchor. Positive values indicate right and down, while negative values indicate left and up. If used with text-variable-anchor, input values will be taken as absolute values. Offsets along the x- and y-axis will be applied automatically based on the anchor position.
    @objc public var textOffset : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textOffset)
        }
        set {
            _self.textOffset = newValue?.arrayOfDouble()
        }
    }

    /// If true, icons will display without their corresponding text when the text collides with other symbols and the icon does not.
    @objc public var textOptional : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textOptional)
        }
        set {
            _self.textOptional = newValue?.boolean()
        }
    }

    /// Size of the additional area around the text bounding box used for detecting symbol collisions.
    @objc public var textPadding : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textPadding)
        }
        set {
            _self.textPadding = newValue?.double()
        }
    }

    /// Orientation of text when map is pitched.
    @objc public var textPitchAlignment : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textPitchAlignment)
        }
        set {
            _self.textPitchAlignment = newValue?.textPitchAlignment()
        }
    }

    /// Radial offset of text, in the direction of the symbol's anchor. Useful in combination with `text-variable-anchor`, which defaults to using the two-dimensional `text-offset` if present.
    @objc public var textRadialOffset : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textRadialOffset)
        }
        set {
            _self.textRadialOffset = newValue?.double()
        }
    }

    /// Rotates the text clockwise.
    @objc public var textRotate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textRotate)
        }
        set {
            _self.textRotate = newValue?.double()
        }
    }

    /// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
    @objc public var textRotationAlignment : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textRotationAlignment)
        }
        set {
            _self.textRotationAlignment = newValue?.textRotationAlignment()
        }
    }

    /// Font size.
    @objc public var textSize : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textSize)
        }
        set {
            _self.textSize = newValue?.double()
        }
    }

    /// Specifies how to capitalize text, similar to the CSS `text-transform` property.
    @objc public var textTransform : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textTransform)
        }
        set {
            _self.textTransform = newValue?.textTransform()
        }
    }

    /// To increase the chance of placing high-priority labels on the map, you can provide an array of `text-anchor` locations: the renderer will attempt to place the label at each location, in order, before moving onto the next label. Use `text-justify: auto` to choose justification based on anchor position. To apply an offset, use the `text-radial-offset` or the two-dimensional `text-offset`.
    @objc public var textVariableAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textVariableAnchor)
        }
        set {
            _self.textVariableAnchor = newValue?.arrayOfTextAnchor()
        }
    }

    /// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
    @objc public var textWritingMode : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textWritingMode)
        }
        set {
            _self.textWritingMode = newValue?.arrayOfTextWritingMode()
        }
    }

    /// The color of the icon. This can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc public var iconColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconColor)
        }
        set {
            _self.iconColor = newValue?.styleColor()
        }
    }

    /// Transition options for `iconColor`.
    @objc public var iconColorTransition : TMBStyleTransition? {
                get {
                    return _self.iconColorTransition?.objcValue()
                }
                set {
                    _self.iconColorTransition = newValue?.rawValue
                }
            }

    /// Fade out the halo towards the outside.
    @objc public var iconHaloBlur : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconHaloBlur)
        }
        set {
            _self.iconHaloBlur = newValue?.double()
        }
    }

    /// Transition options for `iconHaloBlur`.
    @objc public var iconHaloBlurTransition : TMBStyleTransition? {
                get {
                    return _self.iconHaloBlurTransition?.objcValue()
                }
                set {
                    _self.iconHaloBlurTransition = newValue?.rawValue
                }
            }

    /// The color of the icon's halo. Icon halos can only be used with [SDF icons](/help/troubleshooting/using-recolorable-images-in-mapbox-maps/).
    @objc public var iconHaloColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconHaloColor)
        }
        set {
            _self.iconHaloColor = newValue?.styleColor()
        }
    }

    /// Transition options for `iconHaloColor`.
    @objc public var iconHaloColorTransition : TMBStyleTransition? {
                get {
                    return _self.iconHaloColorTransition?.objcValue()
                }
                set {
                    _self.iconHaloColorTransition = newValue?.rawValue
                }
            }

    /// Distance of halo to the icon outline.
    @objc public var iconHaloWidth : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconHaloWidth)
        }
        set {
            _self.iconHaloWidth = newValue?.double()
        }
    }

    /// Transition options for `iconHaloWidth`.
    @objc public var iconHaloWidthTransition : TMBStyleTransition? {
                get {
                    return _self.iconHaloWidthTransition?.objcValue()
                }
                set {
                    _self.iconHaloWidthTransition = newValue?.rawValue
                }
            }

    /// The opacity at which the icon will be drawn.
    @objc public var iconOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconOpacity)
        }
        set {
            _self.iconOpacity = newValue?.double()
        }
    }

    /// Transition options for `iconOpacity`.
    @objc public var iconOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.iconOpacityTransition?.objcValue()
                }
                set {
                    _self.iconOpacityTransition = newValue?.rawValue
                }
            }

    /// Distance that the icon's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc public var iconTranslate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconTranslate)
        }
        set {
            _self.iconTranslate = newValue?.arrayOfDouble()
        }
    }

    /// Transition options for `iconTranslate`.
    @objc public var iconTranslateTransition : TMBStyleTransition? {
                get {
                    return _self.iconTranslateTransition?.objcValue()
                }
                set {
                    _self.iconTranslateTransition = newValue?.rawValue
                }
            }

    /// Controls the frame of reference for `icon-translate`.
    @objc public var iconTranslateAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.iconTranslateAnchor)
        }
        set {
            _self.iconTranslateAnchor = newValue?.iconTranslateAnchor()
        }
    }

    /// The color with which the text will be drawn.
    @objc public var textColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textColor)
        }
        set {
            _self.textColor = newValue?.styleColor()
        }
    }

    /// Transition options for `textColor`.
    @objc public var textColorTransition : TMBStyleTransition? {
                get {
                    return _self.textColorTransition?.objcValue()
                }
                set {
                    _self.textColorTransition = newValue?.rawValue
                }
            }

    /// The halo's fadeout distance towards the outside.
    @objc public var textHaloBlur : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textHaloBlur)
        }
        set {
            _self.textHaloBlur = newValue?.double()
        }
    }

    /// Transition options for `textHaloBlur`.
    @objc public var textHaloBlurTransition : TMBStyleTransition? {
                get {
                    return _self.textHaloBlurTransition?.objcValue()
                }
                set {
                    _self.textHaloBlurTransition = newValue?.rawValue
                }
            }

    /// The color of the text's halo, which helps it stand out from backgrounds.
    @objc public var textHaloColor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textHaloColor)
        }
        set {
            _self.textHaloColor = newValue?.styleColor()
        }
    }

    /// Transition options for `textHaloColor`.
    @objc public var textHaloColorTransition : TMBStyleTransition? {
                get {
                    return _self.textHaloColorTransition?.objcValue()
                }
                set {
                    _self.textHaloColorTransition = newValue?.rawValue
                }
            }

    /// Distance of halo to the font outline. Max text halo width is 1/4 of the font-size.
    @objc public var textHaloWidth : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textHaloWidth)
        }
        set {
            _self.textHaloWidth = newValue?.double()
        }
    }

    /// Transition options for `textHaloWidth`.
    @objc public var textHaloWidthTransition : TMBStyleTransition? {
                get {
                    return _self.textHaloWidthTransition?.objcValue()
                }
                set {
                    _self.textHaloWidthTransition = newValue?.rawValue
                }
            }

    /// The opacity at which the text will be drawn.
    @objc public var textOpacity : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textOpacity)
        }
        set {
            _self.textOpacity = newValue?.double()
        }
    }

    /// Transition options for `textOpacity`.
    @objc public var textOpacityTransition : TMBStyleTransition? {
                get {
                    return _self.textOpacityTransition?.objcValue()
                }
                set {
                    _self.textOpacityTransition = newValue?.rawValue
                }
            }

    /// Distance that the text's anchor is moved from its original placement. Positive values indicate right and down, while negative values indicate left and up.
    @objc public var textTranslate : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textTranslate)
        }
        set {
            _self.textTranslate = newValue?.arrayOfDouble()
        }
    }

    /// Transition options for `textTranslate`.
    @objc public var textTranslateTransition : TMBStyleTransition? {
                get {
                    return _self.textTranslateTransition?.objcValue()
                }
                set {
                    _self.textTranslateTransition = newValue?.rawValue
                }
            }

    /// Controls the frame of reference for `text-translate`.
    @objc public var textTranslateAnchor : TMBValue? {
        get {
            return TMBValue.fromSwiftValue(_self.textTranslateAnchor)
        }
        set {
            _self.textTranslateAnchor = newValue?.textTranslateAnchor()
        }
    }
}

// End of generated file.
