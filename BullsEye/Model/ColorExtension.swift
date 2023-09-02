//
//  ColorExtension.swift
//  BullsEye
//
//  Created by Kirill Streltsov on 02.09.23.
//

import SwiftUI

extension Color {
    /// Create a Color view from an RGB object.
    ///   - parameters:
    ///     - rgb: The RGB object.
    init(rgbStruct rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
    static let element = Color("Element")
    static let highlight = Color("Highlight")
    static let shadow = Color("Shadow")
}
