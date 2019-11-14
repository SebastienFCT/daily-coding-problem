//
//  Problem_173Tests.swift
//  Problem 173Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_173

class Problem_173Tests: XCTestCase {

    func test_example() {
        let input: [String: Any] = [
            "key": 3,
            "foo": [
                "a" : 5,
                "bar" : [
                    "baz": 8
                ]
            ]
        ]
        
        let result = input.flatten()
        XCTAssert(result.keys.contains("key"))
        XCTAssert(result.keys.contains("foo.a"))
        XCTAssert(result.keys.contains("foo.bar.baz"))
        XCTAssert(result.keys.count == 3)
        
        print(result)
    }

}
