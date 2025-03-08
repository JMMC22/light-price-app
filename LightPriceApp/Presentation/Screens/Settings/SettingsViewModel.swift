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
                self.configureDailyNotification(true)
            } else {
                self.configureDailyNotification(false)
            }
        }
    }

    func configureDailyNotification(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: "dailyNotification")
        if value {
            let dailyNotification = LocalNotification(id: "dailyNotification",
                                                      title: "Nuevos precios disponibles",
                                                      body: "¡Ya puede consultar los precios de la luz para mañana!",
                                                      hour: 21,
                                                      repeats: true)
            LocalNotificationsManager.sharedInstance.scheduleNotification(dailyNotification)
        } else {
            LocalNotificationsManager.sharedInstance.cancelNotification(withIdentifier: "dailyNotification")
        }
    }

    func configureDarkMode(_ value: Bool) {
        UserDefaults.standard.set(value, forKey: "darkMode")
    }
}
