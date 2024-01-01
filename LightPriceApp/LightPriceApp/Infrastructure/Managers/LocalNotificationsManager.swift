//
//  LocalNotificationsManager.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 1/1/24.
//

import Foundation
import UserNotifications

class LocalNotificationsManager: ObservableObject {

    static let sharedInstance = LocalNotificationsManager()

    private let notificationCenter = UNUserNotificationCenter.current()

    private init() {}

    func requestPermissions(completion: @escaping (Bool) -> Void) {
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            completion(granted)
        }
    }
}
