//
//  EndpointTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest
@testable import Network

final class EndpointTests: XCTestCase {

    func test_endpoint_default_scheme_is_https() {
        let endpoint = EndpointMock()
        XCTAssertEqual(endpoint.scheme, "https")
    }
}
