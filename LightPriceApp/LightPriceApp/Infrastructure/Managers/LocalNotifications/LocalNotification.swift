//
//  LocalNotification.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 1/1/24.
//

import Foundation

struct LocalNotification {
    let id: String
    let title: String
    let body: String
    let hour: Int
    let minute: Int
    let repeats: Bool

    init(id: String,
         title: String = "",
         body: String = "",
         hour: Int = 0,
         minute: Int = 0,
         repeats: Bool = false) {
        self.id = id
        self.title = title
        self.body = body
        self.hour = hour
        self.minute = minute
        self.repeats = repeats
    }
}
