//
//  Problem_315Tests.swift
//  Problem 315Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_315

class Problem_315Tests: XCTestCase {

    func test_example() {
        
        let input = [
            [1, 2, 3, 4, 8],
            [5, 1, 2, 3, 4],
            [4, 5, 1, 2, 3],
            [7, 4, 5, 1, 2]
        ]
        
        XCTAssertTrue(input.isToeplitz())
        
        
        let input2 = [
            [111, 2, 3, 4, 8],
            [5, 1, 2, 3, 4],
            [4, 5, 1, 2, 3],
            [7, 4, 5, 1, 2]
        ]
        
        XCTAssertFalse(input2.isToeplitz())
    }

}
