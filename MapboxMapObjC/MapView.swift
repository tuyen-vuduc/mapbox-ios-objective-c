//
//  MapView.swift
//  MapboxMapObjC
//
//  Created by Tuyen Vu on 5/8/22.
//

import Foundation
import MapboxMaps

extension MapView {
    @objc public convenience init(frame: CGRect, options: MapInitOptions) {
        self.init(frame: frame, mapInitOptions: options)
    }
}
