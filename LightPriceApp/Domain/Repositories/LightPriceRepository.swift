//
//  LightPriceRepository.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation
import Network

protocol LightPriceRepository {
    func getData(date: String) async -> Result<LightPriceData, RequestError>
    func findBestPriceRange(for hoursPrices: [LightPrice], withHours count: Int, from startRange: String, to endRange: String) -> LightPriceBestRange
}
