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
            Group {
                homeTab
                settingsTab
            }
            .toolbarBackground(Color.customWhite, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(.customBlack01)
    }

    private var homeTab: some View {
        GeneralView()
            .tabItem {
                Label("content.home", systemImage: "house")
            }
    }

    private var settingsTab: some View {
        SettingsView()
            .tabItem {
                Label("content.settings", systemImage: "gear")
            }
    }
}

#Preview {
    ContentView()
}
