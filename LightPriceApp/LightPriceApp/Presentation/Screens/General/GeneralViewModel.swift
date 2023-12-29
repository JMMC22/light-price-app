//
//  GeneralViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation

class GeneralViewModel: ObservableObject {

    private let lightPriceRespository: LightPriceRepository

    init(lightPriceRespository: LightPriceRepository) {
        self.lightPriceRespository = lightPriceRespository
    }
}
