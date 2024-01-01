//
//  ContentView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            homeTab
            settingsTab
        }
    }

    private var homeTab: some View {
        GeneralView()
            .tabItem {
                Label("Home", systemImage: "house")
            }
    }

    private var settingsTab: some View {
        SettingsView()
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
    }
}

#Preview {
    ContentView()
}
