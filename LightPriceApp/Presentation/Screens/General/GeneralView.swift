//
//  GeneralView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import SwiftUI
import Network

struct GeneralView: View {
    
    @StateObject private var viewModel: GeneralViewModel

    init() {
        let repository = DefaultLightPriceRepository(httpClient: DefaultHTTPClient())
        self._viewModel = StateObject(wrappedValue: GeneralViewModel(lightPriceRespository: repository))
    }

    var body: some View {
        ScrollView {
            GeneralViewContainer(viewModel: viewModel)
        }
        .overlay(error(), alignment: .bottom)
        .task {
            await viewModel.viewDidLoad()
        }
    }

    private func error() -> some View {
        ErrorAlertView()
            .padding(16)
            .opacity(viewModel.error ? 1 : 0)
    }
}

#Preview {
    GeneralView()
}

struct GeneralViewContainer: View {

    @ObservedObject var viewModel: GeneralViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            welcomeDescription
            calendarDrodpown
            currentPricePanel
            cheaperPricePanel
            moreExpensivePricePanel
            priceList
        }
        .onChange(of: viewModel.selectedDate) { _ in
            Task {
                await viewModel.viewDidLoad()
            }
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
        CalendarDropdown(selectedDate: $viewModel.selectedDate)
            .zIndex(1)
    }

    private var currentPricePanel: some View {
        PriceProgressPanel(currentPrice: viewModel.currentPrice?.peninsulaPrice ?? 0.0,
                           minPrice: viewModel.minPrice?.peninsulaPrice ?? 0.0,
                           maxPrice: viewModel.maxPrice?.peninsulaPrice ?? 0.0)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }

    private var cheaperPricePanel: some View {
        PricePanel(date: viewModel.selectedDate,
                   rangeHour: viewModel.minPrice?.hourRange ?? "00-24",
                   price: viewModel.minPrice?.peninsulaPrice ?? 0.0,
                   type: .minPrice)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }

    private var moreExpensivePricePanel: some View {
        PricePanel(date: viewModel.selectedDate,
                   rangeHour: viewModel.maxPrice?.hourRange ?? "00-24",
                   price: viewModel.maxPrice?.peninsulaPrice ?? 0.0,
                   type: .maxPrice)
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
    
    private var priceList: some View {
        VStack(spacing: 16) {
            Text("general.price.list.title")
                .LPFont(.Roboto(16, weight: .bold), color: .customBlack)
            PriceList(prices: viewModel.allPrices,
                      maxPrice: viewModel.maxPrice,
                      minPrice: viewModel.minPrice)
        }
        .redacted(reason: viewModel.isLoading ? .placeholder : [])
    }
}
