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
                GeneralView()
                    .tabItem {
                        Label("content.home", systemImage: "house")
                    }
                
                Text("Settings")
                    .tabItem {
                        Label("content.settings", systemImage: "gear")
                    }
            }
            .toolbarBackground(Color.customWhite, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .tint(.customBlack)
    }
}

#Preview {
    ContentView()
}
