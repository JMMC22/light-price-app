//
//  PriceProgressPanelViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation

class PriceProgressPanelViewModel: ObservableObject {

    @Published var currentPrice: String
    @Published var minPrice: Double
    @Published var maxPrice: Double

    init(currentPrice: Double?,
         minPrice: Double?,
         maxPrice: Double?) {
        self.currentPrice = String(format: "%.3f", (currentPrice ?? 0.0))
        self.minPrice = minPrice ?? 0.0
        self.maxPrice = maxPrice ?? 0.0
    }
}
