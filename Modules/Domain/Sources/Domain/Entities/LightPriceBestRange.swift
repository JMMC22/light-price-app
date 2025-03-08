//
//  LightPriceBestRange.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 2/2/24.
//

import Foundation

public struct LightPriceBestRange {
    public let startHour: String
    public let endHour: String
    public let averagePrice: Double
    
    public init(startHour: String,
                endHour: String,
                averagePrice: Double) {
        self.startHour = startHour
        self.endHour = endHour
        self.averagePrice = averagePrice
    }
}
