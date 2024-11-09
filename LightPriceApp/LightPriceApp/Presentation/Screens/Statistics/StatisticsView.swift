//
//  StatisticsView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 2/2/24.
//

import SwiftUI
import Charts

struct StatisticsView: View {

    @StateObject private var viewModel: StatisticsViewModel

    init() {
        let lightPriceRepository = DefaultLightPriceRepository(httpClient: HTTPClient())
        self._viewModel = StateObject(wrappedValue: StatisticsViewModel(lightPriceRespository: lightPriceRepository))
    }

    var body: some View {
        ScrollView {
            StatisticsContainerView(viewModel: viewModel)
        }
        .task {
            await viewModel.viewDidLoad()
        }
    }
}

#Preview {
    StatisticsView()
}

struct StatisticsContainerView: View {

    @ObservedObject var viewModel: StatisticsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            header
            content
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("statistics.tab")
                .LPFont(.Roboto(36, weight: .bold), color: .customBlack)
            Text("statistics.description")
                .LPFont(.Roboto(14, weight: .bold), color: .gray)
        }
    }

    private var content: some View {
        VStack(spacing: 24) {
            todayChart()
            Divider()
            bestRange()
        }
    }

    private func todayChart() -> some View {
        VStack(alignment: .leading, spacing: 8) {

            Text("statistics.progress.today")
                .textCase(.uppercase)
                .LPFont(.Roboto(10, weight: .blackItalic), color: .gray)

            Divider()

            Chart(viewModel.allPrices) { item in
                LineMark(
                    x: .value("Date", item.startHour),
                    y: .value("Price", item.peninsulaPrice)
                )
                .foregroundStyle(Color.primaryColor)

                AreaMark(
                    x: .value("Date", item.startHour),
                    y: .value("Price", item.peninsulaPrice)
                )
                .foregroundStyle(LinearGradient(colors: [.secondaryColor],
                                                startPoint: .top, endPoint: .bottom))
            }
            .chartXAxis(.automatic) // TODO: Date axis
            .chartYAxis(.hidden) // TODO: Prices axis
        }
    }

    private func bestRange() -> some View {
        VStack(alignment: .center, spacing: 32) {
            Text("statistics.best.description")
                .LPFont(.Roboto(14, weight: .bold), color: .gray)
                .frame(maxWidth: .infinity, alignment: .leading)

            HourRangeSliderView(range: $viewModel.range)

            Text(viewModel.bestRange.startHour + "-" + viewModel.bestRange.endHour + "h")
                .LPFont(.Roboto(48, weight: .blackItalic), color: .customBlack)
        }
    }
}
