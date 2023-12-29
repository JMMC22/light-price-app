//
//  PriceItemList.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI

struct PriceItemList: View {

    let hourRange: String
    let price: Double

    var body: some View {
        HStack {
            Circle()
                .fill(Color.customOrange)
                .frame(width: 18, height: 18)
            Text(hourRange + "h")
                .LPFont(.Roboto(18, weight: .mediumItalic), color: .customBlack)
            Spacer()
            Text("currency.price \(price)")
                .LPFont(.Roboto(18, weight: .bold), color: .customOrange)
        }
    }
}

#Preview {
    PriceItemList(hourRange: "00-01", price: 0.123)
        .padding()
}
