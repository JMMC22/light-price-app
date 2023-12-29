//
//  LightPrice.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

struct LightPrice {
    let id = UUID()
    let date: String
    let startHour: String
    let endHour: String
    let hourRange: String
    let peninsulaPrice: Double
    let ceutaMelillaPrice: Double
}

extension LightPrice {
    var fullDate: String {
        guard let date = DateFormatter.yearMonthDayFormatter.date(from: date) else { return date }
        return DateFormatter.fullDateFormatter.string(from: date)
    }
}
