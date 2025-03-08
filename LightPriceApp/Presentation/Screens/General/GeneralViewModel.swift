//
//  GeneralViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation
import Network

@MainActor
class GeneralViewModel: ObservableObject {

    @Published var currentPrice: LightPrice?
    @Published var maxPrice: LightPrice?
    @Published var minPrice: LightPrice?
    @Published var allPrices: [LightPrice] = []
    @Published var selectedDate: Date = Date()
    @Published var isLoading: Bool = false
    @Published var error: Bool = false

    private let lightPriceRespository: LightPriceRepository

    init(lightPriceRespository: LightPriceRepository) {
        self.lightPriceRespository = lightPriceRespository
    }

    func viewDidLoad() async {
        isLoading = true
        await fetchData()
    }
}

extension GeneralViewModel {
    func fetchData() async {
        let formattedDate = DateFormatter.yearMonthDayFormatter.string(from: selectedDate)
        let result = await lightPriceRespository.getData(date: formattedDate)
        switch result {
        case .success(let response):
            fetchDataDidSuccess(response)
        case .failure(let error):
            fetchDataDidFail(error)
        }
    }

    private func fetchDataDidSuccess(_ response: LightPriceData) {
        currentPrice = response.currentPrice
        maxPrice = response.maxPrice
        minPrice = response.minPrice
        allPrices = response.prices
        isLoading = false
    }

    private func fetchDataDidFail(_ error: RequestError) {
        self.error = true
    }
}
