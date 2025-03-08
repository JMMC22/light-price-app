//
//  PriceList.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI

struct PriceList: View {

    let prices: [LightPrice]
    let maxPrice: LightPrice?
    let minPrice: LightPrice?

    var body: some View {
        VStack {
            ForEach(prices) { price in
                PriceItemList(hourRange: price.hourRange,
                              price: price.peninsulaPrice,
                              status: price.getStatus(maxPrice: maxPrice?.peninsulaPrice ?? 0.0,
                                                      minPrice: minPrice?.peninsulaPrice ?? 0.0))
            }
        }
    }
}
