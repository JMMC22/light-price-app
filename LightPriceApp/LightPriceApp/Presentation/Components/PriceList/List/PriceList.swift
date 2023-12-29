//
//  PriceList.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI

struct PriceList: View {

    var prices: [LightPrice]

    var body: some View {
        VStack {
            ForEach(prices) { price in
                PriceItemList(hourRange: price.hourRange,
                              price: price.peninsulaPrice)
            }
        }
    }
}
