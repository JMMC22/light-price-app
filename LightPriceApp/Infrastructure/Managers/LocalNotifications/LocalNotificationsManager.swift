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
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, _) in
            completion(granted)
        }
    }

    func scheduleNotification(_ notification: LocalNotification) {
        let content = UNMutableNotificationContent()
        content.title = notification.title
        content.body = notification.body
        content.sound = UNNotificationSound.default

        var dateComponents = DateComponents()
        dateComponents.hour = notification.hour
        dateComponents.minute = notification.minute

        let timeZone = TimeZone(identifier: "Europe/Madrid")
        dateComponents.timeZone = timeZone

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: notification.repeats)

        let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in
            guard error == nil else { return }
            print("||DEBUG|| LocalNotificationsManager - Notification scheduled: \(notification.id)")
        }
    }

    func cancelNotification(withIdentifier identifier: String) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.removeDeliveredNotifications(withIdentifiers: [identifier])
    }
}
