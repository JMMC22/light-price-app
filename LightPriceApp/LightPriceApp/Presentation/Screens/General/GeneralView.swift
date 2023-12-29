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

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            welcomeDescription
            currentPricePanel
            cheaperPricePanel
            moreExpensivePricePanel
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var welcomeDescription: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("welcome.title")
                .LPFont(.Roboto(36, weight: .bold), color: .black)
            Text("welcome.description")
                .LPFont(.Roboto(18, weight: .bold), color: .gray)
        }
    }

    private var currentPricePanel: some View {
        PriceProgressPanel(currentPrice: viewModel.currentPrice?.peninsulaPrice ?? 0.0,
                           minPrice: viewModel.minPrice?.peninsulaPrice ?? 0.0,
                           maxPrice: viewModel.maxPrice?.peninsulaPrice ?? 0.0)
    }

    private var cheaperPricePanel: some View {
        PricePanel(date: "26/12/2023",
                   rangeHour: viewModel.minPrice?.hourRange ?? "",
                   price: viewModel.minPrice?.peninsulaPrice ?? 0.0,
                   type: .minPrice)
    }

    private var moreExpensivePricePanel: some View {
        PricePanel(date: "26/12/2023",
                   rangeHour: viewModel.maxPrice?.hourRange ?? "",
                   price: viewModel.maxPrice?.peninsulaPrice ?? 0.0,
                   type: .maxPrice)
    }
}
