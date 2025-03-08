//
//  HTTPClientTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest
@testable import Network

final class HTTPClientTests: XCTestCase {

    func test_success_request_when_response_is_200() async throws {
        // GIVEN
        let expectedData = """
            { "status": "200" }
        """.data(using: .utf8)!

        let mockEndpoint = EndpointMock()
        let sessionMock = createURLSessionMock()
        let sut = DefaultHTTPClient(session: sessionMock)

        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, expectedData)
        }

        // WHEN
        let result = await sut.request(endpoint: mockEndpoint)

        // THEN
        let resultData = try XCTUnwrap(result.get(), "")
        XCTAssertEqual(expectedData, resultData)
    }

    func test_failure_request_when_url_is_not_valid_then_response_is_invalidURL() async {
        // GIVEN
        let mockEndpoint = EndpointMock(path: "💥")
        let sessionMock = createURLSessionMock()
        let sut = DefaultHTTPClient(session: sessionMock)

        // WHEN
        let result = await sut.request(endpoint: mockEndpoint)

        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .invalidURL)
    }

    func test_failure_request_when_no_response() async {
        // GIVEN
        let mockEndpoint = EndpointMock()
        let sessionMock = createURLSessionMock()
        let sut = DefaultHTTPClient(session: sessionMock)

        URLProtocolMock.requestHandler = { request in
            let response = URLResponse(
                url: request.url!,
                mimeType: nil,
                expectedContentLength: 0,
                textEncodingName: nil
            )
            return (response, nil)
        }

        // WHEN
        let result = await sut.request(endpoint: mockEndpoint)

        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .noResponse)
    }

    func test_failure_request_when_response_is_unathorized() async throws {
        // GIVEN
        let mockEndpoint = EndpointMock()
        let sessionMock = createURLSessionMock()
        let sut = DefaultHTTPClient(session: sessionMock)

        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 401,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, nil)
        }

        // WHEN
        let result = await sut.request(endpoint: mockEndpoint)

        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .unauthorized)
    }

    func test_failure_request_when_response_is_diff_error() async throws {
        // GIVEN
        let mockEndpoint = EndpointMock()
        let sessionMock = createURLSessionMock()
        let sut = DefaultHTTPClient(session: sessionMock)

        URLProtocolMock.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 500,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, nil)
        }

        // WHEN
        let result = await sut.request(endpoint: mockEndpoint)

        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .error(statusCode: 500, data: Data()))
    }

    func test_error_request_when_session_throws_error_then_error_is_unknown() async {
        // GIVEN
        let mockEndpoint = EndpointMock()
        let sessionMock = createURLSessionMock()
        let sut = DefaultHTTPClient(session: sessionMock)

        URLProtocolMock.requestHandler = { _ in
            throw URLError(.timedOut)
        }

        // WHEN
        let result = await sut.request(endpoint: mockEndpoint)

        // THEN
        guard case .failure(let error) = result else {
            XCTFail("Expected failure, got success")
            return
        }

        XCTAssertEqual(error, .unknown)
    }
}

private extension HTTPClientTests {
    func createURLSessionMock() -> URLSession {
        let configSessionMock = URLSessionConfiguration.ephemeral
        configSessionMock.protocolClasses = [URLProtocolMock.self]
        return URLSession(configuration: configSessionMock)
    }
}

