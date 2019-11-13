//
//  Problem_172Tests.swift
//  Problem 172Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_172

class Problem_172Tests: XCTestCase {

    func test_example() {
        XCTAssert(["cat", "dog"].indicesForCombinations(s: "dogcatcatcodecatdog") == [13, 0])
        
        XCTAssert(["cat", "dog"].indicesForCombinations(s: "barfoobazbitbyte") == [])
    }

}
