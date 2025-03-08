//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import Foundation
@testable import Domain

extension LightPrice {
    static func mock(date: String = "2024-03-08",
                     startHour: String = "00:00",
                     endHour: String = "01:00",
                     peninsulaPrice: Double = 0.15,
                     ceutaMelillaPrice: Double = 0.12) -> LightPrice {
        LightPrice(date: date,
                   startHour: startHour,
                   endHour: endHour,
                   hourRange: "\(startHour) - \(endHour)",
                   peninsulaPrice: peninsulaPrice,
                   ceutaMelillaPrice: ceutaMelillaPrice)
    }
}
