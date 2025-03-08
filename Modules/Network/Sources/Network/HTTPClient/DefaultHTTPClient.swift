//
//  File.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import Foundation

public class DefaultHTTPClient {

    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }
}

extension DefaultHTTPClient: HTTPClient {

    public func request(endpoint: Endpoint) async -> Result<Data, RequestError> {
        var urlComponents = URLComponents()

        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        if let queryParameters = endpoint.queryParameters {
            urlComponents.queryItems = queryParameters
        }

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        do {
            let (data, response) = try await session.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                return .success(data)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.error(statusCode: response.statusCode, data: data))
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
