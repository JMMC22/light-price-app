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
    @Published var price: String

    init(date: Date, rangeHour: String, price: Double) {
        self.date = DateFormatter.fullDateFormatter.string(from: date)
        self.rangeHour = rangeHour
        self.price = String(format: "%.3f", price)
    }
}
