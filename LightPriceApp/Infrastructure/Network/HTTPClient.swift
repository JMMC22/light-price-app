//
//  HTTPClient.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

protocol HTTPClientProtocol {
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}

class HTTPClient: HTTPClientProtocol {
    func request<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
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
        request.allHTTPHeaderFields = endpoint.headers

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                    return .success(decodedResponse)
                } catch {
                    return .failure(.decode)
                }
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode(description: response.description))
            }
        } catch {
            if (error as NSError).code == NSURLErrorCancelled {
                return .failure(.cancelled)
            }
            return .failure(.unknown)
        }
    }
}
