//
//  PriceCardViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation

class PricePanelViewModel: ObservableObject {

    @Published var date: String
    @Published var rangeHour: String
    @Published var price: Double

    init(date: String, rangeHour: String, price: Double) {
        self.date = date
        self.rangeHour = rangeHour
        self.price = price
    }
}
