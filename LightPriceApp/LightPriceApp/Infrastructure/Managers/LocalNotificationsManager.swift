//
//  LocalNotificationsManager.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 1/1/24.
//

import Foundation
import UserNotifications

class LocalNotificationsManager {

    static let sharedInstance = LocalNotificationsManager()

    func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted, error != nil {
                print("||DEBUG|| Granted notifications permissions")
            } else {
                print("||ERROR|| Denied notifications permissions")
            }
        }
    }
}
