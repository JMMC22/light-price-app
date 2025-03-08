//
//  LPFont.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation
import UIKit
import SwiftUI

struct LPFont {
    var font: UIFont

    static func roboto(_ size: CGFloat, weight: FontWeight) -> LPFont {
        let font = UIFont.font(type: .roboto, weight: weight, size: size)
        return LPFont(font: font)
    }
}

struct LPFontModifier: ViewModifier {
    var font: LPFont
    var color: Color

    func body(content: Content) -> some View {
        content
            .textSelection(.enabled)
            .font(Font(self.font.font))
            .foregroundColor(color)
    }
}

extension View {
    func LPFont(_ font: LPFont, color: Color) -> some View {
        modifier(LPFontModifier(font: font, color: color))
    }
}
