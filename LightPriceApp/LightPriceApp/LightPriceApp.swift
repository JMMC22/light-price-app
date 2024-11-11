//
//  LightPriceAppApp.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import SwiftUI
import LPDesignSystem

@main
struct LightPriceApp: App {

    @AppStorage("darkMode") private var darkModeIsOn: Bool = false

    init() {
        loadFonts()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(darkModeIsOn ? .dark : .light)
        }
    }
}

extension LightPriceApp {
    private func loadFonts() {
        LPFont.registerAllFonts()
    }
}
