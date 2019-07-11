//
//  Problem_47Tests.swift
//  Problem 47Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_47

class Problem_47Tests: XCTestCase {

    func test_exampleFAILED() {
        let input = [9, 11, 8, 5, 7, 10]
        print(input.findLargestDifferenceFAILED())
    }
    
    func test_max_gap() {
        let input = [1, 2, 3, 4, 5]
        XCTAssert(input.maximumGap() == 4)
        
        let input2 = [10, 20, 5]
        XCTAssert(input2.maximumGap() == 0)
        
        let input3 = [10, 3, 5]
        XCTAssert(input3.maximumGap() == 2)
    }
    
    func test_example() {
        let input = [9, 11, 8, 5, 7, 10]
        print(input.findLargestDifference())
    }

}
