//
//  LightPriceAppApp.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import SwiftUI

@main
struct LightPriceApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    @AppStorage("darkMode") private var darkModeIsOn: Bool = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(darkModeIsOn ? .dark : .light)
        }
    }
}
