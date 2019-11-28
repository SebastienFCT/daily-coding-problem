//
//  Problem_186Tests.swift
//  Problem 186Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-27.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_186

class Problem_186Tests: XCTestCase {

    func test_example() {
        let result = [5, 10, 15, 20, 25].pairWithSmallestDifference()
        print(result)
        
        XCTAssert(result.diff == 5)
    }

}
