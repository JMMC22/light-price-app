//
//  GeneralView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI

struct GeneralView: View {
    
    @StateObject private var viewModel: GeneralViewModel

    init() {
        let repository = DefaultLightPriceRepository(httpClient: HTTPClient())
        self._viewModel = StateObject(wrappedValue: GeneralViewModel(lightPriceRespository: repository))
    }

    var body: some View {
        ScrollView {
            GeneralViewContainer(viewModel: viewModel)
        }
        .task {
            await viewModel.viewDidLoad()
        }
    }
}

#Preview {
    GeneralView()
}

struct GeneralViewContainer: View {

    @ObservedObject var viewModel: GeneralViewModel
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            welcomeDescription
            calendarDrodpown
            currentPricePanel
            cheaperPricePanel
            moreExpensivePricePanel
            priceList
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var welcomeDescription: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("welcome.title")
                .LPFont(.Roboto(36, weight: .bold), color: .customBlack)
            Text("welcome.description")
                .LPFont(.Roboto(18, weight: .bold), color: .gray)
        }
    }

    private var calendarDrodpown: some View {
        CalendarDropdown(selectedDate: $selectedDate)
            .zIndex(1)
    }

    private var currentPricePanel: some View {
        PriceProgressPanel(currentPrice: viewModel.currentPrice?.peninsulaPrice ?? 0.0,
                           minPrice: viewModel.minPrice?.peninsulaPrice ?? 0.0,
                           maxPrice: viewModel.maxPrice?.peninsulaPrice ?? 0.0)
    }

    private var cheaperPricePanel: some View {
        PricePanel(date: viewModel.date,
                   rangeHour: viewModel.minPrice?.hourRange ?? "",
                   price: viewModel.minPrice?.peninsulaPrice ?? 0.0,
                   type: .minPrice)
    }

    private var moreExpensivePricePanel: some View {
        PricePanel(date: viewModel.date,
                   rangeHour: viewModel.maxPrice?.hourRange ?? "",
                   price: viewModel.maxPrice?.peninsulaPrice ?? 0.0,
                   type: .maxPrice)
    }
    
    private var priceList: some View {
        VStack(spacing: 16) {
            Text("general.price.list.title")
                .LPFont(.Roboto(16, weight: .bold), color: .customBlack)
            PriceList(prices: viewModel.allPrices,
                      maxPrice: viewModel.maxPrice,
                      minPrice: viewModel.minPrice)
        }
    }
}
