//
//  LightAppliancesTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest
@testable import Domain

final class LightAppliancesTests: XCTestCase {

    func test_suscess_total_consumption() {
        XCTAssertEqual(LightAppliances.airConditioning.totalConsumption,
                       LightAppliances.airConditioning.consumptionPerHour * LightAppliances.airConditioning.typicalDuration,
                       accuracy: 0.01)
        
        XCTAssertEqual(LightAppliances.dryer.totalConsumption,
                       LightAppliances.dryer.consumptionPerHour * LightAppliances.dryer.typicalDuration,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.electricCar.totalConsumption,
                       LightAppliances.electricCar.consumptionPerHour * LightAppliances.electricCar.typicalDuration,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.heater.totalConsumption,
                       LightAppliances.heater.consumptionPerHour * LightAppliances.heater.typicalDuration,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.iron.totalConsumption,
                       LightAppliances.iron.consumptionPerHour * LightAppliances.iron.typicalDuration,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.washingMachine.totalConsumption,
                       LightAppliances.washingMachine.consumptionPerHour * LightAppliances.washingMachine.typicalDuration,
                       accuracy: 0.01)
    }

    func test_success_calculate_cost() {
        // GIVEN
        let averagePrice: Double = 0.2

        // THEN
        XCTAssertEqual(LightAppliances.airConditioning.calculateCost(averagePrice: averagePrice),
                       LightAppliances.airConditioning.totalConsumption * averagePrice,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.dryer.calculateCost(averagePrice: averagePrice),
                       LightAppliances.dryer.totalConsumption * averagePrice,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.electricCar.calculateCost(averagePrice: averagePrice),
                       LightAppliances.electricCar.totalConsumption * averagePrice,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.heater.calculateCost(averagePrice: averagePrice),
                       LightAppliances.heater.totalConsumption * averagePrice,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.iron.calculateCost(averagePrice: averagePrice),
                       LightAppliances.iron.totalConsumption * averagePrice,
                       accuracy: 0.01)

        XCTAssertEqual(LightAppliances.washingMachine.calculateCost(averagePrice: averagePrice),
                       LightAppliances.washingMachine.totalConsumption * averagePrice,
                       accuracy: 0.01)
    }
}

