//
//  Problem_306Tests.swift
//  Problem 306Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-27.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_306

class Problem_306Tests: XCTestCase {

    func test_finish_sorting() {
        
        let sorted = [2, 5, 8, 10, 21, 43, 100]
        var input = [5, 2, 10, 8, 100, 21, 43]
        
        input.finishSorting(maxDistance: 2)
        XCTAssert(input == sorted)
    }

}
