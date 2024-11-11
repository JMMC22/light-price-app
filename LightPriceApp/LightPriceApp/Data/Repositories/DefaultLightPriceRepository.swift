//
//  DefaultLightPriceRepository.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation
import LPDomain

final class DefaultLightPriceRepository {

    private let httpClient: HTTPClientProtocol

    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
}

extension DefaultLightPriceRepository: LightPriceRepository {

    func getData(date: String) async -> Result<LightPriceData, LightPriceError> {
        let endpoint = LightPriceEndpoints.data(date: date)
        let result = await httpClient.request(endpoint: endpoint, responseModel: LightPriceResponseDTO.self)

        switch result {
        case .success(let response):
            let data = LightPriceData(response.toDomain(), date: date)
            return .success(data)
        case .failure(let error):
            return .failure(.generic)
        }
    }
}
