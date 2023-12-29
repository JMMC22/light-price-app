//
//  PriceProgressPanel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI

struct PriceProgressPanel: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("current.price")
                .textCase(.uppercase)
                .LPFont(.Roboto(16, weight: .bold), color: .customBlack)

            Text("currency.price \("0.181")")
                .LPFont(.Roboto(48, weight: .blackItalic), color: .customBlack)

            PriceProgressBar(currentValue: 0.181, minValue: 0.131, maxValue: 0.256)

            Divider()
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    PriceProgressPanel()
        .padding(16)
}
