//
//  StatisticsView.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 2/2/24.
//

import SwiftUI

struct StatisticsView: View {

    @StateObject private var viewModel: StatisticsViewModel

    init() {
        self._viewModel = StateObject(wrappedValue: StatisticsViewModel())
    }

    var body: some View {
        ScrollView {
            StatisticsContainerView(viewModel: viewModel)
        }
    }
}



struct StatisticsContainerView: View {

    @ObservedObject var viewModel: StatisticsViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            title
            content
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var title: some View {
        Text("statistics.tab")
            .LPFont(.Roboto(36, weight: .bold), color: .customBlack)
    }

    private var content: some View {
        VStack(spacing: 0) {
            Text("WIP")
        }
    }
}
