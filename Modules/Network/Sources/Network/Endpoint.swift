// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethodType { get }
    var header: [String: String]? { get }
    var body: [String: Any]? { get }
    var queryParameters: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
}
