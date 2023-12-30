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
    @Published var date: String = DateFormatter.fullDateFormatter.string(from: Date())

    private let lightPriceRespository: LightPriceRepository
    private var formattedDate: String = ""

    init(lightPriceRespository: LightPriceRepository) {
        self.lightPriceRespository = lightPriceRespository
    }

    func viewDidLoad() async {
        await fetchData(date)
    }
}

extension GeneralViewModel {
    func fetchData(_ date: String) async {
        parseDate(date)
        let result = await lightPriceRespository.getData(date: formattedDate)
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

    private func parseDate(_ date: String) {
        if let currentDate = DateFormatter.fullDateFormatter.date(from: date) {
            formattedDate = DateFormatter.yearMonthDayFormatter.string(from: currentDate)
        }
    }
}
