//
//  PriceItemList.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI
import Domain

struct PriceItemList: View {

    let hourRange: String
    let price: Double
    let status: LightPriceStatus

    var body: some View {
        HStack {
            Circle()
                .fill(priceColor)
                .frame(width: 18, height: 18)
            Text(hourRange + "h")
                .LPFont(.Roboto(18, weight: .mediumItalic), color: .customBlack)
            Spacer()
            Text("currency.price \(price)")
                .LPFont(.Roboto(18, weight: .bold), color: priceColor)
        }
    }

    private var priceColor: Color {
        switch status {
        case .low:
            return .customGreen
        case .medium:
            return .customOrange
        case .high:
            return .customRed
        }
    }
}

#Preview {
    PriceItemList(hourRange: "00-01", price: 0.123, status: .medium)
        .padding()
}
