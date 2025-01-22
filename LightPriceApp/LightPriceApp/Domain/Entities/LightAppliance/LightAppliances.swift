//
//  LightAppliances.swift
//  iLuz
//
//  Created by Márquez Crespo, José María on 21/1/25.
//

import Foundation

enum LightAppliances: CaseIterable {
    case airConditioning
    case dryer
    case electricCar
    case heater
    case iron
    case washingMachine

    // Average consumption (kWh/h)
    var consumptionPerHour: Double {
        switch self {
        case .airConditioning:
            return 3.0
        case .dryer:
            return 3.0
        case .electricCar:
            return 11.0
        case .heater:
            return 2.0
        case .iron:
            return 1.5
        case .washingMachine:
            return 0.75
        }
    }

    var typicalDuration: Double {
        switch self {
        case .airConditioning:
            return 6.0
        case .dryer:
            return 1.5
        case .electricCar:
            return 7.0
        case .heater:
            return 4.0
        case .iron:
            return 0.5
        case .washingMachine:
            return 1.5
        }
    }

    var totalConsumption: Double {
        return consumptionPerHour * typicalDuration
    }
}

extension LightAppliances {
    func calculateCost(averagePrice: Double) -> Double {
        return totalConsumption * averagePrice
    }
}

