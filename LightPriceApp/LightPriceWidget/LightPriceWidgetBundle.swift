//
//  LightPriceWidgetBundle.swift
//  LightPriceWidget
//
//  Created by José María Márquez Crespo on 11/11/24.
//

import WidgetKit
import SwiftUI
import LPDesignSystem

@main
struct LightPriceWidgetBundle: WidgetBundle {

    init() {
        LPFont.registerAllFonts()
    }

    var body: some Widget {
        LightPriceWidget()
    }
}
