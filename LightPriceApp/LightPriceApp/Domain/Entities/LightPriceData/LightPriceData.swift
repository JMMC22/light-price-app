//
//  LightPriceData.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation

struct LightPriceData {

    let date: String
    let prices: [LightPrice]
    let maxPrice: LightPrice?
    let minPrice: LightPrice?
    let avgPrice: Double

    init(date: String, 
         prices: [LightPrice],
         maxPrice: LightPrice?, 
         minPrice: LightPrice?,
         avgPrice: Double) {
        self.date = date
        self.prices = prices
        self.maxPrice = maxPrice
        self.minPrice = minPrice
        self.avgPrice = avgPrice
    }

    init(_ response: LightPriceResponse, date: String) {
        self.date = date
        self.prices = response.prices
        self.maxPrice = response.maxPrice
        self.minPrice = response.minPrice
        self.avgPrice = response.avgPrice
    }
}
