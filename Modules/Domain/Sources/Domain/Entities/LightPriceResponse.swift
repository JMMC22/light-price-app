//
//  LightPriceResponse.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

public struct LightPriceResponse {
    let prices: [LightPrice]

    public init(prices: [LightPrice]) {
        self.prices = prices
    }
}

public extension LightPriceResponse {

    var currentPrice: LightPrice? {
        let currentHour = String(format: "%02d", Calendar.current.component(.hour, from: Date()))
        return prices.first(where: { $0.startHour == currentHour })
    }

    var maxPrice: LightPrice? {
        return prices.max(by: { $0.peninsulaPrice < $1.peninsulaPrice })
    }

    var minPrice: LightPrice? {
        return prices.min(by: { $0.peninsulaPrice < $1.peninsulaPrice })
    }

    var avgPrice: Double {
        let allPrices: Double = prices.map({ $0.peninsulaPrice }).reduce(0, +)
        return allPrices / Double(prices.count)
    }
}
