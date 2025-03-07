//
//  Endpoint.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var headers: [String: String]? { get }
    var body: [String: String]? { get }
    var queryParameters: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
}
