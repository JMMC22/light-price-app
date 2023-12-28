//
//  LightPriceRepository.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

protocol LightPriceRepository {
    func getData(date: String) async -> Result<[LightPrice], RequestError>
}
