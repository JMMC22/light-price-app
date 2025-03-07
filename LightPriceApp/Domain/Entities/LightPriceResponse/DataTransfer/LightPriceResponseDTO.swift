//
//  LightPriceResponseDTO.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

struct LightPriceResponseDTO: Decodable {
    let voluntaryPrices: [LightPriceDTO]?

    enum CodingKeys: String, CodingKey {
        case voluntaryPrices = "PVPC"
    }
}

extension LightPriceResponseDTO {
    func toDomain() -> LightPriceResponse {
        LightPriceResponse(prices: voluntaryPrices?.compactMap({ $0.toDomain()}) ?? [])
    }
}
