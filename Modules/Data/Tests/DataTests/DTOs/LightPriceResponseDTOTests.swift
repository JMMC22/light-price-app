//
//  LightPriceResponseDTOTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest

@testable import Data

class LightPriceResponseDTOTests: XCTestCase {
    
    func test_success_to_domain_when_response_contains_no_empty_array() {
        // GIVEN
        let json = """
        {
            "PVPC": [
                {
                    "Dia": "08/03/2025",
                    "Hora": "00-01",
                    "PCB": "81,42",
                    "CYM": "81,42"
                },
                {
                    "Dia": "08/03/2025",
                    "Hora": "01-02",
                    "PCB": "66,52",
                    "CYM": "66,52"
                },
                {
                    "Dia": "08/03/2025",
                    "Hora": "02-03",
                    "PCB": "70,56",
                    "CYM": "70,56"
                }
            ]
        }
        """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        guard let lightPriceResponseDTO = try? decoder.decode(LightPriceResponseDTO.self, from: json) else {
            XCTFail("Decoding failed for the JSON: \(String(data: json, encoding: .utf8) ?? "Invalid JSON")")
            return
        }
        
        // WHEN
        let result = lightPriceResponseDTO.toDomain()
        
        // THEN
        XCTAssertFalse(result.prices.isEmpty)
    }

    func test_success_to_domain_when_response_contains_empty_array() {
        // GIVEN
        let json = """
        {
            "PVPC": []
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()

        guard let lightPriceResponseDTO = try? decoder.decode(LightPriceResponseDTO.self, from: json) else {
            XCTFail("Decoding failed for the JSON: \(String(data: json, encoding: .utf8) ?? "Invalid JSON")")
            return
        }

        // WHEN
        let result = lightPriceResponseDTO.toDomain()

        // THEN
        XCTAssertTrue(result.prices.isEmpty)
    }
}
