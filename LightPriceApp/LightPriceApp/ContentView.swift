//
//  ContentView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .LPFont(.Roboto(24, weight: .bold), color: .customOrange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
