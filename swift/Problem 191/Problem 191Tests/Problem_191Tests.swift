//
//  Problem_191Tests.swift
//  Problem 191Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_191

class Problem_191Tests: XCTestCase {

    func test_example() {
        let input: [Interval] = [(7, 9), (2, 4), (5, 8)]
        let result = input.largestNonOverlappingSubset()
        
        print(result.0)
        XCTAssert(result.currentlyRemoved == 1)
    }
    
    func test_with_unique_possibility() {
        let input: [Interval] = [(1, 3), (2, 4), (1, 2)]
        let result = input.largestNonOverlappingSubset()
        
        print(result.0)
        XCTAssert(result.currentlyRemoved == 1)
    }

}
