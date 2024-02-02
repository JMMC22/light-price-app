//
//  StatisticsViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 2/2/24.
//

import Foundation

class StatisticsViewModel: ObservableObject {

    private var allPrices: [LightPrice] = []

    private let lightPriceRespository: LightPriceRepository

    init(lightPriceRespository: LightPriceRepository) {
        self.lightPriceRespository = lightPriceRespository
    }

    func viewDidLoad() async {
        await fetchData()
    }
    
}

extension StatisticsViewModel {
    func fetchData() async {
        let formattedDate = DateFormatter.yearMonthDayFormatter.string(from: Date())
        let result = await lightPriceRespository.getData(date: formattedDate)
        switch result {
        case .success(let response):
            fetchDataDidSuccess(response)
        case .failure(let error):
            fetchDataDidFail(error)
        }
    }

    private func fetchDataDidSuccess(_ response: LightPriceData) {
        self.allPrices = response.prices
    }

    private func fetchDataDidFail(_ error: RequestError) {
        print("||ERROR|| fetchData: \(error.customDescription)")
    }
}
