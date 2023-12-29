//
//  Fonts.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation
import UIKit
import SwiftUI

enum FontType: String {
    case roboto

    var name: String {
        self.rawValue.capitalized
    }
}

enum FontWeight: String {
    case extraLight
    case light
    case thin
    case regular
    case medium
    case semiBold
    case bold
    case extraBold
    case black
    case extraLightItalic
    case lightItalic
    case thinItalic
    case italic
    case mediumItalic
    case semiBoldItalic
    case boldItalic
    case extraBoldItalic
    case blackItalic

    var name: String {
        "-" + self.rawValue.capitalized
    }
}

extension Font {
    static func font(type: FontType, weight: FontWeight, size: CGFloat) -> Font {
        .custom(type.name + weight.name, size: size)
    }
}

extension UIFont {
    class func font(type: FontType, weight: FontWeight, size: CGFloat) -> UIFont {
        return UIFont(name: type.name + weight.name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
