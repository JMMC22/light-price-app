//
//  GeneralViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 29/12/23.
//

import Foundation

class GeneralViewModel: ObservableObject {

    @Published var currentPrice: LightPrice?
    @Published var maxPrice: LightPrice?
    @Published var minPrice: LightPrice?
    @Published var allPrices: [LightPrice] = []

    private let lightPriceRespository: LightPriceRepository

    init(lightPriceRespository: LightPriceRepository) {
        self.lightPriceRespository = lightPriceRespository
    }

    func viewDidLoad() async {
        await fetchData("2023-12-29")
    }
}

extension GeneralViewModel {
    func fetchData(_ date: String) async {
        let result = await lightPriceRespository.getData(date: date)
        switch result {
        case .success(let response):
            fetchDataDidSuccess(response)
        case .failure(let error):
            fetchDataDidFail(error)
        }
    }

    private func fetchDataDidSuccess(_ response: LightPriceData) {
        DispatchQueue.main.async {
            self.currentPrice = response.currentPrice
            self.maxPrice = response.maxPrice
            self.minPrice = response.minPrice
            self.allPrices = response.prices
        }
    }

    private func fetchDataDidFail(_ error: RequestError) {
        print("||ERROR|| fetchData: \(error.customDescription)")
    }
}
