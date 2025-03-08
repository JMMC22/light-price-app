//
//  LightPriceTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest
@testable import Domain

final class LightPriceTests: XCTestCase {

    func test_success_full_date_when_valid_date() {
        // GIVEN
        let mockLightPrice = LightPrice.mock()

        // WHEN
        let result = mockLightPrice.fullDate

        // THEN
        XCTAssertEqual(result, "08/03/2024")
    }

    func test_success_full_date_when_invalid_date() {
        // GIVEN
        let mockLightPrice = LightPrice.mock(date: "invalid-date")

        // WHEN
        let result = mockLightPrice.fullDate

        // THEN
        XCTAssertEqual(result, "invalid-date")
    }

    func test_success_get_status_is_low() {
        // GIVEN
        let mockLightPrice = LightPrice.mock(peninsulaPrice: 0.12)
        let maxPrice = 0.30
        let minPrice = 0.10
        
        // WHEN
        let result = mockLightPrice.getStatus(maxPrice: maxPrice, minPrice: minPrice)

        // THEN
        XCTAssertEqual(result, .low)
    }

    func test_success_get_status_is_medium() {
        // GIVEN
        let mockLightPrice = LightPrice.mock(peninsulaPrice: 0.20)
        let maxPrice = 0.30
        let minPrice = 0.10
        
        // WHEN
        let result = mockLightPrice.getStatus(maxPrice: maxPrice, minPrice: minPrice)

        // THEN
        XCTAssertEqual(result, .medium)
    }

    func test_success_get_status_is_high() {
        // GIVEN
        let mockLightPrice = LightPrice.mock(peninsulaPrice: 0.28)
        let maxPrice = 0.30
        let minPrice = 0.10
        
        // WHEN
        let result = mockLightPrice.getStatus(maxPrice: maxPrice, minPrice: minPrice)

        // THEN
        XCTAssertEqual(result, .high)
    }
}

