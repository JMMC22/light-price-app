//
//  LightPrice.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

public struct LightPrice: Identifiable {
    public let id = UUID()
    public let date: String
    public let startHour: String
    public let endHour: String
    public let hourRange: String
    public let peninsulaPrice: Double
    public let ceutaMelillaPrice: Double
    
    public init(date: String,
                startHour: String,
                endHour: String,
                hourRange: String,
                peninsulaPrice: Double,
                ceutaMelillaPrice: Double) {
        self.date = date
        self.startHour = startHour
        self.endHour = endHour
        self.hourRange = hourRange
        self.peninsulaPrice = peninsulaPrice
        self.ceutaMelillaPrice = ceutaMelillaPrice
    }
}

public extension LightPrice {
    var fullDate: String {
        guard let date = DateFormatter.yearMonthDayFormatter.date(from: date) else { return date }
        return DateFormatter.fullDateFormatter.string(from: date)
    }
}

public extension LightPrice {
    func getStatus(maxPrice: Double, minPrice: Double) -> LightPriceStatus {
        let range = (maxPrice - minPrice) / 3

        if peninsulaPrice < (minPrice + range) {
            return .low
        } else if peninsulaPrice > (maxPrice - range) {
            return .high
        } else {
            return .medium
        }
    }
}
