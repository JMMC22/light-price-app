//
//  LightPriceDTOTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest

@testable import Data

class LightPriceDTOTests: XCTestCase {
    
    func test_success_to_domain_when_response_contains_all_fields() {
        // GIVEN
        let json = """
        {
            "Dia": "08/03/2025",
            "Hora": "00-01",
            "PCB": "81,42",
            "CYM": "81,42"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()

        guard let lightPriceDTO = try? decoder.decode(LightPriceDTO.self, from: json) else {
            XCTFail("Decoding failed for the JSON: \(String(data: json, encoding: .utf8) ?? "Invalid JSON")")
            return
        }

        // WHEN
        let result = lightPriceDTO.toDomain()
        
        // THEN
        XCTAssertEqual(result.date, "08/03/2025")
        XCTAssertEqual(result.startHour, "00")
        XCTAssertEqual(result.endHour, "01")
        XCTAssertEqual(result.hourRange, "00-01")
        XCTAssertEqual(result.peninsulaPrice, 0.08142)
        XCTAssertEqual(result.ceutaMelillaPrice, 0.08142)
    }

    func test_success_to_domain_when_response_no_contains_cym_parameter() {
        // GIVEN
        let json = """
        {
            "Dia": "08/03/2025",
            "Hora": "00-01",
            "PCB": "81,42"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()

        guard let lightPriceDTO = try? decoder.decode(LightPriceDTO.self, from: json) else {
            XCTFail("Decoding failed for the JSON: \(String(data: json, encoding: .utf8) ?? "Invalid JSON")")
            return
        }

        // WHEN
        let result = lightPriceDTO.toDomain()
        
        // THEN
        XCTAssertEqual(result.date, "08/03/2025")
        XCTAssertEqual(result.startHour, "00")
        XCTAssertEqual(result.endHour, "01")
        XCTAssertEqual(result.hourRange, "00-01")
        XCTAssertEqual(result.peninsulaPrice, 0.08142)
        XCTAssertEqual(result.ceutaMelillaPrice, 0.0)
    }

    func test_success_to_domain_when_response_no_contains_pcb_parameter() {
        // GIVEN
        let json = """
        {
            "Dia": "08/03/2025",
            "Hora": "00-01",
            "CYM": "81,42"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()

        guard let lightPriceDTO = try? decoder.decode(LightPriceDTO.self, from: json) else {
            XCTFail("Decoding failed for the JSON: \(String(data: json, encoding: .utf8) ?? "Invalid JSON")")
            return
        }

        // WHEN
        let result = lightPriceDTO.toDomain()
        
        // THEN
        XCTAssertEqual(result.date, "08/03/2025")
        XCTAssertEqual(result.startHour, "00")
        XCTAssertEqual(result.endHour, "01")
        XCTAssertEqual(result.hourRange, "00-01")
        XCTAssertEqual(result.peninsulaPrice, 0.0)
        XCTAssertEqual(result.ceutaMelillaPrice, 0.08142)
    }

    func test_success_to_domain_when_response_no_contains_hora() {
        // GIVEN
        let json = """
        {
            "Dia": "08/03/2025",
            "PCB": "81,42",
            "CYM": "81,42"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()

        guard let lightPriceDTO = try? decoder.decode(LightPriceDTO.self, from: json) else {
            XCTFail("Decoding failed for the JSON: \(String(data: json, encoding: .utf8) ?? "Invalid JSON")")
            return
        }

        // WHEN
        let result = lightPriceDTO.toDomain()
        
        // THEN
        XCTAssertEqual(result.date, "08/03/2025")
        XCTAssertEqual(result.startHour, "")
        XCTAssertEqual(result.endHour, "")
        XCTAssertEqual(result.hourRange, "-")
        XCTAssertEqual(result.peninsulaPrice, 0.08142)
        XCTAssertEqual(result.ceutaMelillaPrice, 0.08142)
    }
}

