//
//  Problem_19Tests.swift
//  Problem 19Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_19

class Problem_19Tests: XCTestCase {

    func test() {
        let input = [
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3]
        ]
     
        XCTAssert(input.optimum() == ["color 1", "color 1", "color 1"])
        XCTAssert(input.optimumWithDistinctNeighborsV1() == ["color 1", "color 2", "color 1"])
    }
    
    func test2() {
        let input = [
            [1, 2, 3],
            [1, 5, 5],
            [1, 2, 3]
        ]
        
        XCTAssert(input.optimumWithDistinctNeighborsV2() == ["color 2", "color 1", "color 2"])
    }

}
