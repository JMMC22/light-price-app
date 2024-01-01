//
//  SettingsViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 1/1/24.
//

import Foundation

class SettingsViewModel: ObservableObject {

    func requestLocalNotificationsPermissions() {
        LocalNotificationsManager.sharedInstance.requestPermissions { granted in
            if granted {
                print("||DEBUG|| TO DO: Schedule daily notification")
            } else {
                print("||DEBUG|| Denied permissions")
            }
        }
    }
}
