//
//  LightPriceResponseTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest
@testable import Domain

final class LightPriceResponseTests: XCTestCase {

    func test_success_maxPrice_when_highest_price() {
        // GIVEN
        let prices = [
            LightPrice.mock(startHour: "00:00", peninsulaPrice: 0.12),
            LightPrice.mock(startHour: "01:00", peninsulaPrice: 0.15),
            LightPrice.mock(startHour: "02:00", peninsulaPrice: 0.18)
        ]
        let response = LightPriceResponse(prices: prices)

        // WHEN
        let result = response.maxPrice

        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.peninsulaPrice, 0.18)
    }

    func test_success_minPrice_when_lowest_price() {
        // GIVEN
        let prices = [
            LightPrice.mock(startHour: "00:00", peninsulaPrice: 0.12),
            LightPrice.mock(startHour: "01:00", peninsulaPrice: 0.15),
            LightPrice.mock(startHour: "02:00", peninsulaPrice: 0.10)
        ]
        let response = LightPriceResponse(prices: prices)

        // WHEN
        let result = response.minPrice

        // THEN
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.peninsulaPrice, 0.10)
    }

    func test_success_avgPrice_when_multiple_prices() {
        // GIVEN
        let prices = [
            LightPrice.mock(startHour: "00:00", peninsulaPrice: 0.12),
            LightPrice.mock(startHour: "01:00", peninsulaPrice: 0.15),
            LightPrice.mock(startHour: "02:00", peninsulaPrice: 0.18)
        ]
        let response = LightPriceResponse(prices: prices)

        // WHEN
        let result = response.avgPrice

        // THEN
        let expectedAvg = (0.12 + 0.15 + 0.18) / 3
        XCTAssertEqual(result, expectedAvg, accuracy: 0.0001)
    }

    func test_success_no_prices_when_empty_list() {
        // GIVEN
        let response = LightPriceResponse(prices: [])

        // WHEN
        let resultCurrentPrice = response.currentPrice
        let resultMaxPrice = response.maxPrice
        let resultMinPrice = response.minPrice
        let resultAvgPrice = response.avgPrice

        // THEN
        XCTAssertNil(resultCurrentPrice)
        XCTAssertNil(resultMaxPrice)
        XCTAssertNil(resultMinPrice)
        XCTAssertEqual(resultAvgPrice, 0.0)
    }
}

