//
//  StatisticsViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 2/2/24.
//

import Foundation

class StatisticsViewModel: ObservableObject {

    @Published var allPrices: [LightPrice] = []
    @Published var bestRange: LightPriceBestRange

    @Published var range: (Int, Int) = (0, 24) {
        didSet {
            getBestHourRange()
        }
    }

    private let lightPriceRespository: LightPriceRepository

    init(lightPriceRespository: LightPriceRepository) {
        self.lightPriceRespository = lightPriceRespository
        self.bestRange = LightPriceBestRange(startHour: "", endHour: "", averagePrice: 0)
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
        DispatchQueue.main.async {
            self.allPrices = response.prices
            self.getBestHourRange()
        }
    }

    private func fetchDataDidFail(_ error: RequestError) {
        print("||ERROR|| fetchData: \(error.customDescription)")
    }
}

extension StatisticsViewModel {
    func getBestHourRange() {
        let startHour = String(format: "%02d", range.0)
        let endHour = String(format: "%02d", range.1)

        let range = lightPriceRespository.findBestPriceRange(for: allPrices, withHours: 3, from: startHour, to: endHour)
        self.bestRange = range
    }
}
