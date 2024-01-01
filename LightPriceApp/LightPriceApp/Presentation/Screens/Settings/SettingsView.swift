//
//  SettingsView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 1/1/24.
//

import SwiftUI

struct SettingsView: View {

    @StateObject private var viewModel: SettingsViewModel

    init() {
        self._viewModel = StateObject(wrappedValue: SettingsViewModel())
    }

    var body: some View {
        Text("Settings")
    }
}

#Preview {
    SettingsView()
}
