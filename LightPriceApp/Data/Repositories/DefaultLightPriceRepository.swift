//
//  DefaultLightPriceRepository.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation
import Domain
import Network

final class DefaultLightPriceRepository {

    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
}

extension DefaultLightPriceRepository: LightPriceRepository {

    func getData(date: String) async -> Result<LightPriceData, RequestError> {
        let endpoint = LightPriceEndpoints.data(date: date)
        let result = await httpClient.request(endpoint: endpoint)

        switch result {
        case .success(let response):
            guard let response = try? JSONDecoder().decode(LightPriceResponseDTO.self,
                                                           from: response) else {
                return .failure(.decode)
            }
            let data = LightPriceData(response.toDomain(), date: date)
            return .success(data)
        case .failure(let error):
            return .failure(error)
        }
    }

    func findBestPriceRange(for hoursPrices: [LightPrice],
                            withHours count: Int,
                            from startRange: String,
                            to endRange: String) -> LightPriceBestRange {
        let pricesFiltered = hoursPrices.filter({ $0.startHour >= startRange && $0.endHour <= endRange })

        guard !pricesFiltered.isEmpty, count > .zero, count <= pricesFiltered.count else {
            return LightPriceBestRange(startHour: "", endHour: "", averagePrice: 0)
        }

        var bestRange: (startHour: Int, endHour: Int, averagePrice: Double)?
        var currentRange: (startHour: Int, endHour: Int, averagePrice: Double)?

        for value in 0...(pricesFiltered.count - count) {
            let subarray = Array(pricesFiltered[value..<(value + count)])
            let totalPeninsulaPrice = subarray.reduce(0) { $0 + $1.peninsulaPrice }
            let averagePeninsulaPrice = totalPeninsulaPrice / Double(count)

            if let current = currentRange {
                if averagePeninsulaPrice < current.averagePrice {
                    currentRange = (startHour: value, endHour: value + count - 1, averagePrice: averagePeninsulaPrice)
                }
            } else {
                currentRange = (startHour: value, endHour: value + count - 1, averagePrice: averagePeninsulaPrice)
            }

            if let best = bestRange {
                if averagePeninsulaPrice < best.averagePrice {
                    bestRange = currentRange
                }
            } else {
                bestRange = currentRange
            }
        }

        let startHour = pricesFiltered[bestRange?.startHour ?? 0].startHour
        let endHour = pricesFiltered[bestRange?.endHour ?? 0].endHour
        let averagePrice = bestRange?.averagePrice ?? 0

        return LightPriceBestRange(startHour: startHour, endHour: endHour, averagePrice: averagePrice)
    }
}
