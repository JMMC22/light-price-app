//
//  LightPriceData.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation

public struct LightPriceData {

    public let date: String
    public let prices: [LightPrice]
    public let currentPrice: LightPrice?
    public let maxPrice: LightPrice?
    public let minPrice: LightPrice?
    public let avgPrice: Double

    public init(date: String,
         prices: [LightPrice],
         currentPrice: LightPrice?,
         maxPrice: LightPrice?,
         minPrice: LightPrice?,
         avgPrice: Double) {
        self.date = date
        self.prices = prices
        self.currentPrice = currentPrice
        self.maxPrice = maxPrice
        self.minPrice = minPrice
        self.avgPrice = avgPrice
    }

    public init(_ response: LightPriceResponse, date: String) {
        self.date = date
        self.prices = response.prices
        self.currentPrice = response.currentPrice
        self.maxPrice = response.maxPrice
        self.minPrice = response.minPrice
        self.avgPrice = response.avgPrice
    }
}
