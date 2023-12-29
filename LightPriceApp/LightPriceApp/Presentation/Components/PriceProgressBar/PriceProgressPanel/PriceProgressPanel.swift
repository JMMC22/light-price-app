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
            Text("PRECIO ACTUAL")
                .LPFont(.Roboto(16, weight: .bold), color: .customBlack)

            Text("0.181 €/kWh")
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
