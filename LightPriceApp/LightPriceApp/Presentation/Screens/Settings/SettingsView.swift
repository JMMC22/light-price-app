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
        VStack(spacing: 24) {
            NotificationsSettingsSectionView(viewModel: viewModel)
            AppearanceSettingsSectionView(viewModel: viewModel)
        }
    }
}

struct NotificationsSettingsSectionView: View {

    @ObservedObject var viewModel: SettingsViewModel

    @State private var dailyNotificationIsOn: Bool = UserDefaults.standard.bool(forKey: "dailyNotification")

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
            .tint(.primary)
            .onChange(of: dailyNotificationIsOn) { value in
                if value {
                    viewModel.requestLocalNotificationsPermissions()
                } else {
                    viewModel.configureDailyNotification(false)
                }
            }
        }
    }
}

struct AppearanceSettingsSectionView: View {

    @ObservedObject var viewModel: SettingsViewModel

    @State private var darkModeIsOn: Bool = UserDefaults.standard.bool(forKey: "darkMode")

    var body: some View {
        SettingsSection(title: "appearance") {
            Toggle(isOn: $darkModeIsOn) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("dark.mode.appearance")
                        .LPFont(.Roboto(14, weight: .bold), color: .customBlack)
                }
            }
            .tint(.primary)
            .onChange(of: darkModeIsOn) { value in
                viewModel.configureDarkMode(value)
                darkModeIsOn = value
            }
        }
    }
}
