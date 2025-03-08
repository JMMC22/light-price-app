//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import Foundation
@testable import Network

struct EndpointMock: Endpoint {

    var host: String
    var path: String
    var method: HTTPMethodType
    var header: [String: String]?
    var body: [String: Any]?
    var queryParameters: [URLQueryItem]?

    init(host: String = "api.mock.com",
        path: String = "/test",
        method: HTTPMethodType = .get,
        header: [String: String]? = [:],
        body: [String: Any]? = [:],
        queryParameters: [URLQueryItem]? = []) {
        self.host = host
        self.path = path
        self.method = method
        self.header = header
        self.body = body
        self.queryParameters = queryParameters
    }
}
