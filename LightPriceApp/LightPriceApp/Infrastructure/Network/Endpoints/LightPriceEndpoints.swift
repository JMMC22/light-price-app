//
//  ESIOSEndpoint.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

enum LightPriceEndpoints {
    case data(date: String)
}

extension LightPriceEndpoints: Endpoint {

    var host: String {
        return "api.esios.ree.es"
    }

    var path: String {
        switch self {
        case .data:
            return "/archives/70/download_json"
        }
    }

    var method: RequestMethod {
        return .get
    }

    var headers: [String: String]? { return [:] }

    var body: [String: String]? {
        return nil
    }

    var queryParameters: [URLQueryItem]? {
        switch self {
        case .data(let date):
            return [URLQueryItem(name: "date", value: date)]
        }
    }
}
