//
//  HourRangeSliderView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 2/2/24.
//

import SwiftUI

struct HourRangeSliderView: View {
    
    @State var width: CGFloat = 0
    @State var widthTow: CGFloat = 50
    @State var isDragginfLeft = false
    @State var isDragginfRight = false
    @State var totalScreen: CGFloat = 0

    private let barHeight: CGFloat = 20
    private let offsetValue: CGFloat = 40

    private var lowerValue: Int {
        return Int(map(value: width, from: 0...totalScreen, to: 0...24))
    }

    private var higherValue: Int {
        return Int(map(value: widthTow, from: 0...totalScreen, to: 0...24))
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                title()
                slider()
            }
            .onAppear {
                totalScreen = geometry.size.width - offsetValue
                widthTow = totalScreen
            }
        }
    }

    private func title() -> some View {
        Text("\(lowerValue)h-\(higherValue)h")
            .LPFont(.Roboto(18, weight: .blackItalic), color: .customBlack)
    }

    private func slider() -> some View {
        ZStack(alignment: .leading) {

            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(.customSecondary)
                .frame(height: barHeight)

            Rectangle()
                .fill(.customPrimary)
                .frame(width: widthTow - width, height: barHeight)
                .offset(x: width + 20)
            
            HStack(spacing: 0) {
                DraggableCircle(isLeft: true, isDragging: $isDragginfLeft, position: $width,
                                otherPosition: $widthTow, limit: totalScreen)
                DraggableCircle(isLeft: false, isDragging: $isDragginfRight, position: $widthTow,
                                otherPosition: $width, limit: totalScreen)
            }
            
//            ValueBox(isDragging: isDragginfLeft, value: lowerValue, position: width, xOffset: -18)
//            ValueBox(isDragging: isDragginfRight, value: higherValue, position: widthTow, xOffset: 0)
        }
    }

    func map(value: CGFloat, from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
        let inputRange = from.upperBound - from.lowerBound
        guard inputRange != 0 else { return 0 }
        let outputRange = to.upperBound - to.lowerBound
        return (value - from.lowerBound) / inputRange * outputRange + to.lowerBound
    }
}

#Preview {
    HourRangeSliderView()
        .padding(16)
}

struct DraggableCircle: View {

    let isLeft: Bool
    @Binding var isDragging: Bool
    @Binding var position: CGFloat
    @Binding var otherPosition: CGFloat
    let limit: CGFloat

    var body: some View {
        ZStack {
            Circle().frame(width: 30, height: 30)
                .foregroundStyle(Color.primaryColor)
                .shadow(radius: 2)

            Circle().frame(width: 25, height: 25)
                .foregroundStyle(Color.white)
        }
        .offset(x: position + (isLeft ? 0 : -15))
        .gesture(
            DragGesture()
                .onChanged({ value in
                    withAnimation {
                        isDragging = true
                    }

                    if isLeft {
                        position = min(max(value.location.x, 0), otherPosition)
                    } else {
                        position = min(max(value.location.x, otherPosition), limit)
                    }
                })
                .onEnded({ value in
                    withAnimation {
                        isDragging = false
                        let result = map(value: position, from: 0...limit, to: 0...24).rounded()
                        position = result * (limit / 24)
                    }
                })
        )
    }

    func map(value: CGFloat, from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
        let inputRange = from.upperBound - from.lowerBound
        guard inputRange != 0 else { return 0 }
        let outputRange = to.upperBound - to.lowerBound
        return (value - from.lowerBound) / inputRange * outputRange + to.lowerBound
    }
}

struct ValueBox: View {

    let isDragging: Bool
    let value: Int
    let position: CGFloat
    let xOffset: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(width: 60, height: 40)
                .foregroundStyle(isDragging ? .black : .clear)
            
            Text(String(value))
                .foregroundStyle(isDragging ? .white : .clear)
        }
        .scaleEffect(isDragging ? 1: 0)
        .offset(x: position + xOffset, y: isDragging ? -40 : 0)
    }
}
