//
//  Problem_1cTests.swift
//  Problem 1cTests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_1c

class Problem_1cTests: XCTestCase {

    func test_true() {
        
        let input = [10, 6, 12, 890, 10, 10, 20, 5, 10, 90, 12, 22, 9, 10]
        
        XCTAssertTrue(input.hasCombination(withCount: 5, forSum: 50))
    }
    
    func test_false() {
        
        let input = [10, 10, 10, 10, 10, 10, 10, 10, 10, 1, 1, 1, 1]
        
        XCTAssertFalse(input.hasCombination(withCount: 5, forSum: 59))
    }

}
