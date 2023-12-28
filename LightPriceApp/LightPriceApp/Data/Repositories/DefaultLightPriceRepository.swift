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

    func getData(date: String) async -> Result<LightPrice, RequestError> {
        let endpoint = LightPriceEndpoints.data(date: date)
        let result = await httpClient.request(endpoint: endpoint, responseModel: LightPriceDTO.self)

        switch result {
        case .success(let response):
            return .success(response.toDomain())
        case .failure(let error):
            return .failure(error)
        }
    }
}
