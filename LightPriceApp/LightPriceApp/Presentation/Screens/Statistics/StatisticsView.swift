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
            Divider()
            appliancesCosts()
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
                .foregroundStyle(LinearGradient(colors: [.primaryColor.opacity(0.6)],
                                                startPoint: .top, endPoint: .bottom))
            }
            .chartXAxis {
                AxisMarks { value in
                    AxisValueLabel {
                        Text(String(describing: value.as(String.self) ?? "-"))
                            .rotationEffect(.degrees(-80))
                    }
                }
            }
            .chartYAxis(.hidden) // TODO: Prices axis
        }
    }

    private func bestRange() -> some View {
        VStack(alignment: .center, spacing: 32) {
            Text("statistics.best.description")
                .LPFont(.Roboto(14, weight: .bold), color: .gray)
                .frame(maxWidth: .infinity, alignment: .leading)

            HourRangeSliderView(range: $viewModel.range)

            if (viewModel.range.1 - viewModel.range.0) < 3 {
                Text("no.information.range")
                    .LPFont(.Roboto(12, weight: .blackItalic), color: .gray)
            } else {
                Text(viewModel.bestRange.startHour + "-" + viewModel.bestRange.endHour + "h")
                    .LPFont(.Roboto(48, weight: .blackItalic), color: .customBlack)
            }
        }
    }
    
    private func appliancesCosts() -> some View {
        LazyVGrid(columns: [.init(alignment: .center), .init(alignment: .center)]) {
            ForEach(viewModel.appliancesCosts) { appliance in
                HStack {
                    Image(appliance.appliance.icon)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(Color.customBlack)

                    VStack(spacing: 2) {
                        Text(LocalizedStringKey(appliance.appliance.title))
                            .LPFont(.Roboto(12, weight: .semiBold), color: .customBlack)
                        Divider()
                        
                        HStack(alignment: .center, spacing: 2) {
                            Text("~ \(appliance.appliance.typicalDuration, specifier: "%.1f") h")
                            Text("|")
                            Text("~ \(appliance.appliance.consumptionPerHour, specifier: "%.2f") kWh/h")
                        }
                        .LPFont(.Roboto(10, weight: .regular), color: .gray)

                        Text(String(format: "%.2f €", appliance.cost))
                            .LPFont(.Roboto(14, weight: .bold), color: .customBlack)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
            }
        }
    }
}
