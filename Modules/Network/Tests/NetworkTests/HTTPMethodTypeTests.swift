//
//  HTTPMethodTypeTests.swift
//  
//
//  Created by Márquez Crespo, José María on 8/3/25.
//

import XCTest
@testable import Network

final class HTTPMethodTypeTests: XCTestCase {

    func test_success_type_values_are_correct() {
        XCTAssertEqual(HTTPMethodType.get.rawValue, "GET")
        XCTAssertEqual(HTTPMethodType.head.rawValue, "HEAD")
        XCTAssertEqual(HTTPMethodType.post.rawValue, "POST")
        XCTAssertEqual(HTTPMethodType.put.rawValue, "PUT")
        XCTAssertEqual(HTTPMethodType.patch.rawValue, "PATCH")
        XCTAssertEqual(HTTPMethodType.delete.rawValue, "DELETE")
    }
}
