//
//  Problem_62Tests.swift
//  Problem 62Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_62

class Problem_62Tests: XCTestCase {

    func test_1() {
        let input = [[0,0],[0,0]]
        
        print(input.possibilities(current: (0,0)))
    }
    
    func test_example() {
        let input = [[0,0],[0,0]]
        
        XCTAssert(input.pathCount(current: (0,0), to: (1,1)) == 2)
    }

    func test_example2() {
        let input = [
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0]
        ]
        
        XCTAssert(input.pathCount(current: (0,0), to: (4,4)) == 70)
    }
}
