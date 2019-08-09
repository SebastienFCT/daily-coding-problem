//
//  Problem_76Tests.swift
//  Problem 76Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_76

class Problem_76Tests: XCTestCase {

    func test_example() {
        let input: [[Character]] = [
            ["c", "b", "a"],
            ["d", "a", "f"],
            ["g", "h", "i"]
        ]
        
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().count == 1)
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().indexes == [1])
    }
    
    func test_example2() {
        let input: [[Character]] = [
            ["a", "b", "c", "d", "e", "f"]
        ]
        
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().count == 0)
    }
    
    func test_example3() {
        let input: [[Character]] = [
            ["z","y","x"],
            ["w","v","u"],
            ["t","s","r"]
        ]
        
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().count == 3)
    }

}
