//
//  StatisticsViewModel.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 2/2/24.
//

import Foundation
import Domain
import Network

class StatisticsViewModel: ObservableObject {

    @Published var allPrices: [LightPrice]
    @Published var bestRange: LightPriceBestRange
    @Published var appliancesCosts: [LightApplianceCost]

    @Published var range: (Int, Int) = (0, 24) {
        didSet {
            updateUI(prices: allPrices)
        }
    }

    private let lightPriceRespository: LightPriceRepository

    init(lightPriceRespository: LightPriceRepository) {
        self.lightPriceRespository = lightPriceRespository
        self.allPrices = []
        self.bestRange = LightPriceBestRange(startHour: "", endHour: "", averagePrice: 0)
        self.appliancesCosts = []
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
            self.updateUI(prices: response.prices)
        }
    }

    private func fetchDataDidFail(_ error: RequestError) {
        print("||ERROR|| fetchData: \(error.localizedDescription)")
    }
}

extension StatisticsViewModel {

    private func updateUI(prices: [LightPrice]) {
        self.allPrices = prices

        let bestRange = getBestHourRange()
        let appliancesCosts = getLightAppliancesCosts(avgPrice: bestRange.averagePrice)

        self.bestRange = bestRange
        self.appliancesCosts = appliancesCosts
    }

    func getBestHourRange() -> LightPriceBestRange {
        let startHour = String(format: "%02d", range.0)
        let endHour = String(format: "%02d", range.1)
        let range = lightPriceRespository.findBestPriceRange(for: allPrices, withHours: 3, from: startHour, to: endHour)
        return range
    }

    func getLightAppliancesCosts(avgPrice: Double) -> [LightApplianceCost] {
        let appliancesCost = LightAppliances.allCases.map { appliance in
            LightApplianceCost(appliance: appliance, cost: appliance.calculateCost(averagePrice: avgPrice))
        }
        return appliancesCost
    }
}
