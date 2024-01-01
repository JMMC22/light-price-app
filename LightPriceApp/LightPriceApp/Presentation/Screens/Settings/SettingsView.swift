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
            NotificationsSettingsSectionView(viewModel: viewModel)
        }
    }
}

struct NotificationsSettingsSectionView: View {

    @ObservedObject var viewModel: SettingsViewModel

    @State private var dailyNotificationIsOn: Bool = false

    var body: some View {
        SettingsSection(title: "notifications") {
            Toggle(isOn: $dailyNotificationIsOn) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("daily.notifications")
                        .LPFont(.Roboto(14, weight: .bold), color: .customBlack)
                    Text("daily.notification.description")
                        .LPFont(.Roboto(12, weight: .regular), color: .gray)
                }
            }
            .onChange(of: dailyNotificationIsOn) { value in
                print("||DEBUG|| Daily notification is \(value)")
            }
        }
    }
}
