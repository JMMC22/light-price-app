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
