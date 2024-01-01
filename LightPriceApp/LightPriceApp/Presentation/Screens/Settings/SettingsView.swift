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
        ScrollView {
            SettingsContainerView(viewModel: viewModel)
        }
    }
}

#Preview {
    SettingsView()
}

struct SettingsContainerView: View {

    @ObservedObject var viewModel: SettingsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            title
            content
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var title: some View {
        Text("settings.title")
            .LPFont(.Roboto(36, weight: .bold), color: .customBlack)
    }

    private var content: some View {
        VStack {
            SettingsSection(title: "Notificaciones") {
                Button("Permisos") {
                    viewModel.requestLocalNotificationsPermissions()
                }
            }
        }
    }
}
