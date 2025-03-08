//
//  LightAppliances.swift
//  iLuz
//
//  Created by Márquez Crespo, José María on 21/1/25.
//

import Foundation

public enum LightAppliances: CaseIterable {
    case airConditioning
    case dryer
    case electricCar
    case heater
    case iron
    case washingMachine

    public var title: String {
        switch self {
        case .airConditioning:
            return "air.conditioning"
        case .dryer:
            return "dryer"
        case .electricCar:
            return "electric.car"
        case .heater:
            return "heater"
        case .iron:
            return "iron"
        case .washingMachine:
            return "washing.machine"
        }
    }
    
    public var icon: String {
        switch self {
        case .airConditioning:
            return "air-conditioner"
        case .dryer:
            return "dryer"
        case .electricCar:
            return "electric-car"
        case .heater:
            return "heater"
        case .iron:
            return "iron"
        case .washingMachine:
            return "washing-machine"
        }
    }

    // Average consumption (kWh/h)
    public var consumptionPerHour: Double {
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

    public var typicalDuration: Double {
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

    public var totalConsumption: Double {
        return consumptionPerHour * typicalDuration
    }
}

public extension LightAppliances {
    func calculateCost(averagePrice: Double) -> Double {
        return totalConsumption * averagePrice
    }
}

