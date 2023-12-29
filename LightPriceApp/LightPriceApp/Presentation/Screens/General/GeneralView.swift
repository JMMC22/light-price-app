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
        Text("General View")
    }
}

#Preview {
    GeneralView()
}
