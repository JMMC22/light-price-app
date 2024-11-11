//
//  LightPriceRepository.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

public protocol LightPriceRepository {
    func getData(date: String) async -> Result<LightPriceData, LightPriceError>
}
