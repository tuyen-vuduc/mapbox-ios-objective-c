import MapboxMaps


let visibilityMapping: [TMBVisibility:Visibility] = [

    /// The layer is shown.
    .visible : .visible,

    /// The layer is not shown.
    .none : .none,
]

// MARK: LINE_CAP

/// The display of line endings.
let lineCapMapping: [TMBLineCap:LineCap] = [

    /// A cap with a squared-off end which is drawn to the exact endpoint of the line.
    .butt : .butt,

    /// A cap with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    .round : .round,

    /// A cap with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    .square : .square,

]

// MARK: LINE_JOIN

/// The display of lines when joining.
let lineJoinMapping: [TMBLineJoin:LineJoin] = [

    /// A join with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    .bevel : .bevel,

    /// A join with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    .round : .round,

    /// A join with a sharp, angled corner which is drawn with the outer sides beyond the endpoint of the path until they meet.
    .miter : .miter,

]

// MARK: ICON_ANCHOR

/// Part of the icon placed closest to the anchor.
let iconAnchorMapping: [TMBIconAnchor:IconAnchor] = [

    /// The center of the icon is placed closest to the anchor.
    .center : .center,

    /// The left side of the icon is placed closest to the anchor.
    .left : .left,

    /// The right side of the icon is placed closest to the anchor.
    .right : .right,

    /// The top of the icon is placed closest to the anchor.
    .top : .top,

    /// The bottom of the icon is placed closest to the anchor.
    .bottom : .bottom,

    /// The top left corner of the icon is placed closest to the anchor.
    .topLeft : .topLeft,

    /// The top right corner of the icon is placed closest to the anchor.
    .topRight : .topRight,

    /// The bottom left corner of the icon is placed closest to the anchor.
    .bottomLeft : .bottomLeft,

    /// The bottom right corner of the icon is placed closest to the anchor.
    .bottomRight : .bottomRight,

]

// MARK: ICON_PITCH_ALIGNMENT

/// Orientation of icon when map is pitched.
let iconPitchAlignmentMapping: [TMBIconPitchAlignment:IconPitchAlignment] = [

    /// The icon is aligned to the plane of the map.
    .map : .map,

    /// The icon is aligned to the plane of the viewport.
    .viewport : .viewport,

    /// Automatically matches the value of [@link ICON_ROTATION_ALIGNMENT].
    .auto : .auto,

]

// MARK: ICON_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of icons.
let iconRotationAlignmentMapping: [TMBIconRotationAlignment:IconRotationAlignment] = [

    /// When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_POINT], aligns icons east-west. When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_LINE] or [@link Property#SYMBOL_PLACEMENT_LINE_CENTER], aligns icon x-axes with the line.
    .map : .map,

    /// Produces icons whose x-axes are aligned with the x-axis of the viewport, regardless of the value of [@link SYMBOL_PLACEMENT].
    .viewport : .viewport,

    /// When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_POINT], this is equivalent to [@link Property#ICON_ROTATION_ALIGNMENT_VIEWPORT]. When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_LINE] or [@link Property#SYMBOL_PLACEMENT_LINE_CENTER], this is equivalent to [@link Property#ICON_ROTATION_ALIGNMENT_MAP].
    .auto : .auto,

]

// MARK: ICON_TEXT_FIT

/// Scales the icon to fit around the associated text.
let iconTextFitMapping: [TMBIconTextFit:IconTextFit] = [

    /// The icon is displayed at its intrinsic aspect ratio.
    .none : .none,

    /// The icon is scaled in the x-dimension to fit the width of the text.
    .width : .width,

    /// The icon is scaled in the y-dimension to fit the height of the text.
    .height : .height,

    /// The icon is scaled in both x- and y-dimensions.
    .both : .both,

]

// MARK: SYMBOL_PLACEMENT

/// Label placement relative to its geometry.
let symbolPlacementMapping: [TMBSymbolPlacement:SymbolPlacement] = [

    /// The label is placed at the point where the geometry is located.
    .point : .point,

    /// The label is placed along the line of the geometry. Can only be used on LineString and Polygon geometries.
    .line : .line,

    /// The label is placed at the center of the line of the geometry. Can only be used on LineString and Polygon geometries. Note that a single feature in a vector tile may contain multiple line geometries.
    .lineCenter : .lineCenter,

]

// MARK: SYMBOL_Z_ORDER

/// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
let symbolZOrderMapping: [TMBSymbolZOrder:SymbolZOrder] = [

    /// Sorts symbols by symbol sort key if set. Otherwise, sorts symbols by their y-position relative to the viewport if [@link ICON_ALLOW_OVERLAP] or [@link TEXT_ALLOW_OVERLAP] is set to [@link TRUE] or [@link ICON_IGNORE_PLACEMENT] or [@link TEXT_IGNORE_PLACEMENT] is [@link FALSE].
    .auto : .auto,

    /// Sorts symbols by their y-position relative to the viewport if [@link ICON_ALLOW_OVERLAP] or [@link TEXT_ALLOW_OVERLAP] is set to [@link TRUE] or [@link ICON_IGNORE_PLACEMENT] or [@link TEXT_IGNORE_PLACEMENT] is [@link FALSE].
    .viewportY : .viewportY,

    /// Sorts symbols by symbol sort key if set. Otherwise, no sorting is applied; symbols are rendered in the same order as the source data.
    .source : .source,

]

// MARK: TEXT_ANCHOR

/// Part of the text placed closest to the anchor.
let textAnchorMapping: [TMBTextAnchor:TextAnchor] = [

    /// The center of the text is placed closest to the anchor.
    .center : .center,

    /// The left side of the text is placed closest to the anchor.
    .left : .left,

    /// The right side of the text is placed closest to the anchor.
    .right : .right,

    /// The top of the text is placed closest to the anchor.
    .top : .top,

    /// The bottom of the text is placed closest to the anchor.
    .bottom : .bottom,

    /// The top left corner of the text is placed closest to the anchor.
    .topLeft : .topLeft,

    /// The top right corner of the text is placed closest to the anchor.
    .topRight : .topRight,

    /// The bottom left corner of the text is placed closest to the anchor.
    .bottomLeft : .bottomLeft,

    /// The bottom right corner of the text is placed closest to the anchor.
    .bottomRight : .bottomRight,

]

// MARK: TEXT_JUSTIFY

/// Text justification options.
let textJustifyMapping: [TMBTextJustify:TextJustify] = [

    /// The text is aligned towards the anchor position.
    .auto : .auto,

    /// The text is aligned to the left.
    .left : .left,

    /// The text is centered.
    .center : .center,

    /// The text is aligned to the right.
    .right : .right,

]

// MARK: TEXT_PITCH_ALIGNMENT

/// Orientation of text when map is pitched.
let textPitchAlignmentMapping: [TMBTextPitchAlignment:TextPitchAlignment] = [

    /// The text is aligned to the plane of the map.
    .map : .map,

    /// The text is aligned to the plane of the viewport.
    .viewport : .viewport,

    /// Automatically matches the value of [@link TEXT_ROTATION_ALIGNMENT].
    .auto : .auto,

]

// MARK: TEXT_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
let textRotationAlignmentMapping: [TMBTextRotationAlignment:TextRotationAlignment] = [

    /// When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_POINT], aligns text east-west. When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_LINE] or [@link Property#SYMBOL_PLACEMENT_LINE_CENTER], aligns text x-axes with the line.
    .map : .map,

    /// Produces glyphs whose x-axes are aligned with the x-axis of the viewport, regardless of the value of [@link SYMBOL_PLACEMENT].
    .viewport : .viewport,

    /// When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_POINT], this is equivalent to [@link Property#TEXT_ROTATION_ALIGNMENT_VIEWPORT]. When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_LINE] or [@link Property#SYMBOL_PLACEMENT_LINE_CENTER], this is equivalent to [@link Property#TEXT_ROTATION_ALIGNMENT_MAP].
    .auto : .auto,

]

// MARK: TEXT_TRANSFORM

/// Specifies how to capitalize text, similar to the CSS `text-transform` property.
let textTransformMapping: [TMBTextTransform:TextTransform] = [

    /// The text is not altered.
    .none : .none,

    /// Forces all letters to be displayed in uppercase.
    .uppercase : .uppercase,

    /// Forces all letters to be displayed in lowercase.
    .lowercase : .lowercase,

]

// MARK: FILL_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-translate`.
let fillTranslateAnchorMapping: [TMBFillTranslateAnchor:FillTranslateAnchor] = [

    /// The fill is translated relative to the map.
    .map : .map,

    /// The fill is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: LINE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `line-translate`.
let lineTranslateAnchorMapping: [TMBLineTranslateAnchor:LineTranslateAnchor] = [

    /// The line is translated relative to the map.
    .map : .map,

    /// The line is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: ICON_TRANSLATE_ANCHOR

/// Controls the frame of reference for `icon-translate`.
let iconTranslateAnchorMapping: [TMBIconTranslateAnchor:IconTranslateAnchor] = [

    /// Icons are translated relative to the map.
    .map : .map,

    /// Icons are translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: TEXT_TRANSLATE_ANCHOR

/// Controls the frame of reference for `text-translate`.
let textTranslateAnchorMapping: [TMBTextTranslateAnchor:TextTranslateAnchor] = [

    /// The text is translated relative to the map.
    .map : .map,

    /// The text is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: CIRCLE_PITCH_ALIGNMENT

/// Orientation of circle when map is pitched.
let circlePitchAlignmentMapping: [TTMBirclePitchAlignment:CirclePitchAlignment] = [

    /// The circle is aligned to the plane of the map.
    .map : .map,

    /// The circle is aligned to the plane of the viewport.
    .viewport : .viewport,

]

// MARK: CIRCLE_PITCH_SCALE

/// Controls the scaling behavior of the circle when the map is pitched.
let circlePitchScaleMapping: [TTMBirclePitchScale:CirclePitchScale] = [

    /// Circles are scaled according to their apparent distance to the camera.
    .map : .map,

    /// Circles are not scaled.
    .viewport : .viewport,

]

// MARK: CIRCLE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `circle-translate`.
let circleTranslateAnchorMapping: [TTMBircleTranslateAnchor:CircleTranslateAnchor] = [

    /// The circle is translated relative to the map.
    .map : .map,

    /// The circle is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: FILL_EXTRUSION_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-extrusion-translate`.
let fillExtrusionTranslateAnchorMapping: [TMBFillExtrusionTranslateAnchor:FillExtrusionTranslateAnchor] = [

    /// The fill extrusion is translated relative to the map.
    .map : .map,

    /// The fill extrusion is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: RASTER_RESAMPLING

/// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
let rasterResamplingMapping: [TMBRasterResampling:RasterResampling] = [

    /// (Bi)linear filtering interpolates pixel values using the weighted average of the four closest original source pixels creating a smooth but blurry look when overscaled
    .linear : .linear,

    /// Nearest neighbor filtering interpolates pixel values using the nearest original source pixel creating a sharp but pixelated look when overscaled
    .nearest : .nearest,

]

// MARK: HILLSHADE_ILLUMINATION_ANCHOR

/// Direction of light source when map is rotated.
let hillshadeIlluminationAnchorMapping: [TMBHillshadeIlluminationAnchor:HillshadeIlluminationAnchor] = [

    /// The hillshade illumination is relative to the north direction.
    .map : .map,

    /// The hillshade illumination is relative to the top of the viewport.
    .viewport : .viewport,

]

// MARK: SKY_TYPE

/// The type of the sky
public let skyTypeMapping: [TMBSkyType:SkyType] = [

    /// Renders the sky with a gradient that can be configured with [@link SKY_GRADIENT_RADIUS] and [@link SKY_GRADIENT].
    .gradient : .gradient,

    /// Renders the sky with a simulated atmospheric scattering algorithm, the sun direction can be attached to the light position or explicitly set through [@link SKY_ATMOSPHERE_SUN].
    .atmosphere : .atmosphere,

]

// MARK: ANCHOR

/// Whether extruded geometries are lit relative to the map or viewport.
let anchorMapping: [TMBAnchor:Anchor] = [

    /// The position of the light source is aligned to the rotation of the map.
    .map : .map,

    /// The position of the light source is aligned to the rotation of the viewport.
    .viewport : .viewport,

]

// MARK: NAME

/// The name of the projection to be used for rendering the map.
let styleProjectionNameMapping: [TMBStyleProjectionName:StyleProjectionName] = [

    /// The Mercator projection is the default projection.
    .mercator : .mercator,

    /// A globe projection.
    .globe : .globe,

]

// MARK: TEXT_WRITING_MODE

/// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
let textWritingModeMapping: [TMBTextWritingMode:TextWritingMode] = [

    /// If a text's language supports horizontal writing mode, symbols would be laid out horizontally.
    .horizontal : .horizontal,

    /// If a text's language supports vertical writing mode, symbols would be laid out vertically.
    .vertical : .vertical,

]

let TMBvisibilityMapping: [Visibility:TMBVisibility] = [

    /// The layer is shown.
    .visible : .visible,

    /// The layer is not shown.
    .none : .none,
]

// MARK: LINE_CAP

/// The display of line endings.
let TMBlineCapMapping: [LineCap:TMBLineCap] = [

    /// A cap with a squared-off end which is drawn to the exact endpoint of the line.
    .butt : .butt,

    /// A cap with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    .round : .round,

    /// A cap with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    .square : .square,

]

// MARK: LINE_JOIN

/// The display of lines when joining.
let TMBlineJoinMapping: [LineJoin:TMBLineJoin] = [

    /// A join with a squared-off end which is drawn beyond the endpoint of the line at a distance of one-half of the line's width.
    .bevel : .bevel,

    /// A join with a rounded end which is drawn beyond the endpoint of the line at a radius of one-half of the line's width and centered on the endpoint of the line.
    .round : .round,

    /// A join with a sharp, angled corner which is drawn with the outer sides beyond the endpoint of the path until they meet.
    .miter : .miter,

]

// MARK: ICON_ANCHOR

/// Part of the icon placed closest to the anchor.
let TMBiconAnchorMapping: [IconAnchor:TMBIconAnchor] = [

    /// The center of the icon is placed closest to the anchor.
    .center : .center,

    /// The left side of the icon is placed closest to the anchor.
    .left : .left,

    /// The right side of the icon is placed closest to the anchor.
    .right : .right,

    /// The top of the icon is placed closest to the anchor.
    .top : .top,

    /// The bottom of the icon is placed closest to the anchor.
    .bottom : .bottom,

    /// The top left corner of the icon is placed closest to the anchor.
    .topLeft : .topLeft,

    /// The top right corner of the icon is placed closest to the anchor.
    .topRight : .topRight,

    /// The bottom left corner of the icon is placed closest to the anchor.
    .bottomLeft : .bottomLeft,

    /// The bottom right corner of the icon is placed closest to the anchor.
    .bottomRight : .bottomRight,

]

// MARK: ICON_PITCH_ALIGNMENT

/// Orientation of icon when map is pitched.
let TMBiconPitchAlignmentMapping: [IconPitchAlignment:TMBIconPitchAlignment] = [

    /// The icon is aligned to the plane of the map.
    .map : .map,

    /// The icon is aligned to the plane of the viewport.
    .viewport : .viewport,

    /// Automatically matches the value of [@link ICON_ROTATION_ALIGNMENT].
    .auto : .auto,

]

// MARK: ICON_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of icons.
let TMBiconRotationAlignmentMapping: [IconRotationAlignment:TMBIconRotationAlignment] = [

    /// When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_POINT], aligns icons east-west. When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_LINE] or [@link Property#SYMBOL_PLACEMENT_LINE_CENTER], aligns icon x-axes with the line.
    .map : .map,

    /// Produces icons whose x-axes are aligned with the x-axis of the viewport, regardless of the value of [@link SYMBOL_PLACEMENT].
    .viewport : .viewport,

    /// When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_POINT], this is equivalent to [@link Property#ICON_ROTATION_ALIGNMENT_VIEWPORT]. When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_LINE] or [@link Property#SYMBOL_PLACEMENT_LINE_CENTER], this is equivalent to [@link Property#ICON_ROTATION_ALIGNMENT_MAP].
    .auto : .auto,

]

// MARK: ICON_TEXT_FIT

/// Scales the icon to fit around the associated text.
let TMBiconTextFitMapping: [IconTextFit:TMBIconTextFit] = [

    /// The icon is displayed at its intrinsic aspect ratio.
    .none : .none,

    /// The icon is scaled in the x-dimension to fit the width of the text.
    .width : .width,

    /// The icon is scaled in the y-dimension to fit the height of the text.
    .height : .height,

    /// The icon is scaled in both x- and y-dimensions.
    .both : .both,

]

// MARK: SYMBOL_PLACEMENT

/// Label placement relative to its geometry.
let TMBsymbolPlacementMapping: [SymbolPlacement:TMBSymbolPlacement] = [

    /// The label is placed at the point where the geometry is located.
    .point : .point,

    /// The label is placed along the line of the geometry. Can only be used on LineString and Polygon geometries.
    .line : .line,

    /// The label is placed at the center of the line of the geometry. Can only be used on LineString and Polygon geometries. Note that a single feature in a vector tile may contain multiple line geometries.
    .lineCenter : .lineCenter,

]

// MARK: SYMBOL_Z_ORDER

/// Determines whether overlapping symbols in the same layer are rendered in the order that they appear in the data source or by their y-position relative to the viewport. To control the order and prioritization of symbols otherwise, use `symbol-sort-key`.
let TMBsymbolZOrderMapping: [SymbolZOrder:TMBSymbolZOrder] = [

    /// Sorts symbols by symbol sort key if set. Otherwise, sorts symbols by their y-position relative to the viewport if [@link ICON_ALLOW_OVERLAP] or [@link TEXT_ALLOW_OVERLAP] is set to [@link TRUE] or [@link ICON_IGNORE_PLACEMENT] or [@link TEXT_IGNORE_PLACEMENT] is [@link FALSE].
    .auto : .auto,

    /// Sorts symbols by their y-position relative to the viewport if [@link ICON_ALLOW_OVERLAP] or [@link TEXT_ALLOW_OVERLAP] is set to [@link TRUE] or [@link ICON_IGNORE_PLACEMENT] or [@link TEXT_IGNORE_PLACEMENT] is [@link FALSE].
    .viewportY : .viewportY,

    /// Sorts symbols by symbol sort key if set. Otherwise, no sorting is applied; symbols are rendered in the same order as the source data.
    .source : .source,

]

// MARK: TEXT_ANCHOR

/// Part of the text placed closest to the anchor.
let TMBtextAnchorMapping: [TextAnchor:TMBTextAnchor] = [

    /// The center of the text is placed closest to the anchor.
    .center : .center,

    /// The left side of the text is placed closest to the anchor.
    .left : .left,

    /// The right side of the text is placed closest to the anchor.
    .right : .right,

    /// The top of the text is placed closest to the anchor.
    .top : .top,

    /// The bottom of the text is placed closest to the anchor.
    .bottom : .bottom,

    /// The top left corner of the text is placed closest to the anchor.
    .topLeft : .topLeft,

    /// The top right corner of the text is placed closest to the anchor.
    .topRight : .topRight,

    /// The bottom left corner of the text is placed closest to the anchor.
    .bottomLeft : .bottomLeft,

    /// The bottom right corner of the text is placed closest to the anchor.
    .bottomRight : .bottomRight,

]

// MARK: TEXT_JUSTIFY

/// Text justification options.
let TMBtextJustifyMapping: [TextJustify:TMBTextJustify] = [

    /// The text is aligned towards the anchor position.
    .auto : .auto,

    /// The text is aligned to the left.
    .left : .left,

    /// The text is centered.
    .center : .center,

    /// The text is aligned to the right.
    .right : .right,

]

// MARK: TEXT_PITCH_ALIGNMENT

/// Orientation of text when map is pitched.
let TMBtextPitchAlignmentMapping: [TextPitchAlignment:TMBTextPitchAlignment] = [

    /// The text is aligned to the plane of the map.
    .map : .map,

    /// The text is aligned to the plane of the viewport.
    .viewport : .viewport,

    /// Automatically matches the value of [@link TEXT_ROTATION_ALIGNMENT].
    .auto : .auto,

]

// MARK: TEXT_ROTATION_ALIGNMENT

/// In combination with `symbol-placement`, determines the rotation behavior of the individual glyphs forming the text.
let TMBtextRotationAlignmentMapping: [TextRotationAlignment:TMBTextRotationAlignment] = [

    /// When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_POINT], aligns text east-west. When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_LINE] or [@link Property#SYMBOL_PLACEMENT_LINE_CENTER], aligns text x-axes with the line.
    .map : .map,

    /// Produces glyphs whose x-axes are aligned with the x-axis of the viewport, regardless of the value of [@link SYMBOL_PLACEMENT].
    .viewport : .viewport,

    /// When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_POINT], this is equivalent to [@link Property#TEXT_ROTATION_ALIGNMENT_VIEWPORT]. When [@link SYMBOL_PLACEMENT] is set to [@link Property#SYMBOL_PLACEMENT_LINE] or [@link Property#SYMBOL_PLACEMENT_LINE_CENTER], this is equivalent to [@link Property#TEXT_ROTATION_ALIGNMENT_MAP].
    .auto : .auto,

]

// MARK: TEXT_TRANSFORM

/// Specifies how to capitalize text, similar to the CSS `text-transform` property.
let TMBtextTransformMapping: [TextTransform:TMBTextTransform] = [

    /// The text is not altered.
    .none : .none,

    /// Forces all letters to be displayed in uppercase.
    .uppercase : .uppercase,

    /// Forces all letters to be displayed in lowercase.
    .lowercase : .lowercase,

]

// MARK: FILL_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-translate`.
let TMBfillTranslateAnchorMapping: [FillTranslateAnchor:TMBFillTranslateAnchor] = [

    /// The fill is translated relative to the map.
    .map : .map,

    /// The fill is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: LINE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `line-translate`.
let TMBlineTranslateAnchorMapping: [LineTranslateAnchor:TMBLineTranslateAnchor] = [

    /// The line is translated relative to the map.
    .map : .map,

    /// The line is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: ICON_TRANSLATE_ANCHOR

/// Controls the frame of reference for `icon-translate`.
let TMBiconTranslateAnchorMapping: [IconTranslateAnchor:TMBIconTranslateAnchor] = [

    /// Icons are translated relative to the map.
    .map : .map,

    /// Icons are translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: TEXT_TRANSLATE_ANCHOR

/// Controls the frame of reference for `text-translate`.
let TMBtextTranslateAnchorMapping: [TextTranslateAnchor:TMBTextTranslateAnchor] = [

    /// The text is translated relative to the map.
    .map : .map,

    /// The text is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: CIRCLE_PITCH_ALIGNMENT

/// Orientation of circle when map is pitched.
let TTMBirclePitchAlignmentMapping: [CirclePitchAlignment:TTMBirclePitchAlignment] = [

    /// The circle is aligned to the plane of the map.
    .map : .map,

    /// The circle is aligned to the plane of the viewport.
    .viewport : .viewport,

]

// MARK: CIRCLE_PITCH_SCALE

/// Controls the scaling behavior of the circle when the map is pitched.
let TTMBirclePitchScaleMapping: [CirclePitchScale:TTMBirclePitchScale] = [

    /// Circles are scaled according to their apparent distance to the camera.
    .map : .map,

    /// Circles are not scaled.
    .viewport : .viewport,

]

// MARK: CIRCLE_TRANSLATE_ANCHOR

/// Controls the frame of reference for `circle-translate`.
let TTMBircleTranslateAnchorMapping: [CircleTranslateAnchor:TTMBircleTranslateAnchor] = [

    /// The circle is translated relative to the map.
    .map : .map,

    /// The circle is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: FILL_EXTRUSION_TRANSLATE_ANCHOR

/// Controls the frame of reference for `fill-extrusion-translate`.
let TMBfillExtrusionTranslateAnchorMapping: [FillExtrusionTranslateAnchor:TMBFillExtrusionTranslateAnchor] = [

    /// The fill extrusion is translated relative to the map.
    .map : .map,

    /// The fill extrusion is translated relative to the viewport.
    .viewport : .viewport,

]

// MARK: RASTER_RESAMPLING

/// The resampling/interpolation method to use for overscaling, also known as texture magnification filter
let TMBrasterResamplingMapping: [RasterResampling:TMBRasterResampling] = [

    /// (Bi)linear filtering interpolates pixel values using the weighted average of the four closest original source pixels creating a smooth but blurry look when overscaled
    .linear : .linear,

    /// Nearest neighbor filtering interpolates pixel values using the nearest original source pixel creating a sharp but pixelated look when overscaled
    .nearest : .nearest,

]

// MARK: HILLSHADE_ILLUMINATION_ANCHOR

/// Direction of light source when map is rotated.
let TMBhillshadeIlluminationAnchorMapping: [HillshadeIlluminationAnchor:TMBHillshadeIlluminationAnchor] = [

    /// The hillshade illumination is relative to the north direction.
    .map : .map,

    /// The hillshade illumination is relative to the top of the viewport.
    .viewport : .viewport,

]

// MARK: SKY_TYPE

/// The type of the sky
public let TMBskyTypeMapping: [SkyType:TMBSkyType] = [

    /// Renders the sky with a gradient that can be configured with [@link SKY_GRADIENT_RADIUS] and [@link SKY_GRADIENT].
    .gradient : .gradient,

    /// Renders the sky with a simulated atmospheric scattering algorithm, the sun direction can be attached to the light position or explicitly set through [@link SKY_ATMOSPHERE_SUN].
    .atmosphere : .atmosphere,

]

// MARK: ANCHOR

/// Whether extruded geometries are lit relative to the map or viewport.
let TMBanchorMapping: [Anchor:TMBAnchor] = [

    /// The position of the light source is aligned to the rotation of the map.
    .map : .map,

    /// The position of the light source is aligned to the rotation of the viewport.
    .viewport : .viewport,

]

// MARK: NAME

/// The name of the projection to be used for rendering the map.
let TMBstyleProjectionNameMapping: [StyleProjectionName:TMBStyleProjectionName] = [

    /// The Mercator projection is the default projection.
    .mercator : .mercator,

    /// A globe projection.
    .globe : .globe,

]

// MARK: TEXT_WRITING_MODE

/// The property allows control over a symbol's orientation. Note that the property values act as a hint, so that a symbol whose language doesn’t support the provided orientation will be laid out in its natural orientation. Example: English point symbol will be rendered horizontally even if array value contains single 'vertical' enum value. For symbol with point placement, the order of elements in an array define priority order for the placement of an orientation variant. For symbol with line placement, the default text writing mode is either ['horizontal', 'vertical'] or ['vertical', 'horizontal'], the order doesn't affect the placement.
let TMBtextWritingModeMapping: [TextWritingMode:TMBTextWritingMode] = [

    /// If a text's language supports horizontal writing mode, symbols would be laid out horizontally.
    .horizontal : .horizontal,

    /// If a text's language supports vertical writing mode, symbols would be laid out vertically.
    .vertical : .vertical,

]

// End of generated file.
