//
//  Problem_299Tests.swift
//  Problem 299Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_299

class Problem_299Tests: XCTestCase {

    func test_example() {
        
        let map = [
            ("plant", [("a", 1), ("b", 5), ("c", 20)]),
            ("a", [("c", 15)]),
            ("b", [("c", 10)]),
            ("c", []),
        ]
        
        let input = Hydro(map: map)
        let actual = input.optimize()
        
        XCTAssert(actual == 16)
    }

}
