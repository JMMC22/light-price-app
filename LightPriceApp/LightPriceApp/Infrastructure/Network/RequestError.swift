//
//  RequestError.swift
//  LightPriceApp
//
//  Created by José María Márquez Crespo on 28/12/23.
//

import Foundation

enum RequestError: Error, Equatable {
    case cancelled
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode(description: String)
    case unknown

    var customDescription: String {
        switch self {
        case .cancelled: return "Request cancelled"
        case .decode: return "Decode error"
        case .invalidURL: return "Invalid URL"
        case .unauthorized: return "Unauthorized"
        case .unexpectedStatusCode(let description): return "Unexpected Status Code: \(description)"
        default: return "Unknown error"
        }
    }
}
