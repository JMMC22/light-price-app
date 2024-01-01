//
//  PriceProgressPanel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI

struct PriceProgressPanel: View {
    
    @ObservedObject private var viewModel: PriceProgressPanelViewModel

    init(currentPrice: Double? = 0.0,
         minPrice: Double? = 0.0,
         maxPrice: Double? = 0.0) {
        self._viewModel = ObservedObject(wrappedValue: PriceProgressPanelViewModel(currentPrice: currentPrice,
                                                                                   minPrice: minPrice,
                                                                                   maxPrice: maxPrice))
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text("current.price \(Date().getHour())")
                .textCase(.uppercase)
                .LPFont(.Roboto(16, weight: .bold), color: .customBlack)

            Text("currency.price \(viewModel.currentPrice)")
                .LPFont(.Roboto(48, weight: .blackItalic), color: .customBlack)

            PriceProgressBar(currentValue: Double(viewModel.currentPrice) ?? 0.0,
                             minValue: viewModel.minPrice,
                             maxValue: viewModel.maxPrice)

            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    PriceProgressPanel()
        .padding(16)
}
