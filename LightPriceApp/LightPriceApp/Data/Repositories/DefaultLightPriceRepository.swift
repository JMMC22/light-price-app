//
//  DefaultLightPriceRepository.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

final class DefaultLightPriceRepository {

    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
}

extension DefaultLightPriceRepository: LightPriceRepository {

    func getData(date: String) async -> Result<LightPriceData, RequestError> {
        let endpoint = LightPriceEndpoints.data(date: date)
        let result = await httpClient.request(endpoint: endpoint, responseModel: LightPriceResponseDTO.self)

        switch result {
        case .success(let response):
            let data = LightPriceData(response.toDomain(), date: date)
            return .success(data)
        case .failure(let error):
            return .failure(error)
        }
    }
}
