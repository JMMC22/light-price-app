//
//  RequestErrorTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest
@testable import Network

class RequestErrorTests: XCTestCase {

    func test_sucess_errors_are_equals() {
        XCTAssertEqual(RequestError.invalidURL, .invalidURL)
        XCTAssertEqual(RequestError.noResponse, .noResponse)
        XCTAssertEqual(RequestError.unauthorized, .unauthorized)
        XCTAssertEqual(RequestError.unknown, .unknown)
        XCTAssertEqual(RequestError.decode, .decode)
    }

    func test_success_errors_are_not_equals() {
        XCTAssertNotEqual(RequestError.invalidURL, .noResponse)
        XCTAssertNotEqual(RequestError.unauthorized, .unknown)
        XCTAssertNotEqual(RequestError.decode, .error(statusCode: 500, data: nil))
    }

    func test_success_error_with_status_code_is_equatable() {
        XCTAssertEqual(RequestError.error(statusCode: 404, data: nil), .error(statusCode: 404, data: nil))
        XCTAssertNotEqual(RequestError.error(statusCode: 400, data: nil), .error(statusCode: 500, data: nil))
    }

    func test_success_request_error_localized_description() {
        XCTAssertEqual(RequestError.invalidURL.localizedDescription, "The URL provided is invalid.")
        XCTAssertEqual(RequestError.noResponse.localizedDescription, "No response received from the server.")
        XCTAssertEqual(RequestError.unauthorized.localizedDescription, "Unauthorized access - please check your credentials.")
        XCTAssertEqual(RequestError.unknown.localizedDescription, "An unknown error occurred.")
        XCTAssertEqual(RequestError.decode.localizedDescription, "Failed to decode the response.")
        XCTAssertEqual(RequestError.error(statusCode: 500, data: nil).localizedDescription, "Error with status code: 500")
    }
}
