//
//  PriceProgressBar.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI

struct PriceProgressBar: View {

    let currentValue: Double
    let minValue: Double
    let maxValue: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [.customGreen, .customOrange, .customRed]),
                            startPoint: .leading,
                            endPoint: .trailing)
                    )
                
                Circle()
                    .fill()
                    .frame(width: 25, height: 25)
                    .position(CGPoint(x: positionX * geometry.size.width, y: 10))
            }
            .frame(height: 20)
        }
    }

    private var positionX: Double {
        let diference = maxValue - minValue
        let result = (currentValue - minValue) / diference
        return result
    }
}

#Preview {
    PriceProgressBar(currentValue: 0.191, minValue: 0.131, maxValue: 0.256)
}
