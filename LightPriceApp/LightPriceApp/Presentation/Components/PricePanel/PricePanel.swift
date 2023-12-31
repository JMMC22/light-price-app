//
//  PriceCard.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation
import SwiftUI

struct PricePanel: View {

    @ObservedObject private var viewModel: PricePanelViewModel

    enum PricePanelType {
        case maxPrice
        case minPrice
    }

    private let type: PricePanelType

    init(date: Date,
         rangeHour: String,
         price: Double,
         type: PricePanel.PricePanelType) {
        self._viewModel = ObservedObject(wrappedValue: PricePanelViewModel(date: date,
                                                                        rangeHour: rangeHour,
                                                                        price: price))
        self.type = type
    }

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .LPFont(.Roboto(16, weight: .bold), color: .customBlack)
            Text(viewModel.rangeHour + "h")
                .LPFont(.Roboto(48, weight: .blackItalic), color: .customBlack)
            HStack(alignment: .center) {
                Image(priceIcon)
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(priceColor)
                Text(String(viewModel.price) + " €/kWh")
                    .LPFont(.Roboto(18, weight: .bold), color: priceColor)
            }
            
            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }

    private var title: LocalizedStringKey {
        return type == .maxPrice ? "worst.hour.price.date \(viewModel.date)"
                                 : "best.hour.price.date \(viewModel.date)"
    }

    private var priceColor: Color {
        return type == .maxPrice ? .customRed : .customGreen
    }

    private var priceIcon: String {
        return type == .maxPrice ? "arrows-up" : "arrows-down"
    }
}

#Preview {
    VStack {
        PricePanel(date: Date(), rangeHour: "12h - 13h", price: 0.256, type: .maxPrice)
        PricePanel(date: Date(), rangeHour: "20h - 21h", price: 1.256, type: .minPrice)
    }
}
