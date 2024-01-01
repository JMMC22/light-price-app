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

            GeneralView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
