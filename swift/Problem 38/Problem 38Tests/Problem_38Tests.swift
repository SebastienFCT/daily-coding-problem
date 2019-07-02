//
//  Problem_38Tests.swift
//  Problem 38Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_38

class Problem_38Tests: XCTestCase {

    func test_1() {
        let input = [
            [true, false, false],
            [false, false, false],
            [false, false, false]
        ]
        
        XCTAssertTrue(input.hasElementOnRow(0))
        XCTAssertFalse(input.hasElementOnRow(1))
        
        XCTAssertTrue(input.hasElementOnColumn(0))
        XCTAssertFalse(input.hasElementOnColumn(1))
        
        XCTAssertTrue(input.hasElementOnDiagonalsOf(row: 1, column: 1))
        XCTAssertTrue(input.hasElementOnDiagonalsOf(row: 2, column: 2))
        XCTAssertFalse(input.hasElementOnDiagonalsOf(row: 2, column: 1))
    }
    
    func test_2() {
        let input = [
            [false, false],
            [false, false]
        ]
        
        print(input.findHowManyArrangement())
    }
    
    func test_3() {
        let input = [
            [false, false, false],
            [false, false, false],
            [false, false, false]
        ]

        print(input.findHowManyArrangement())
    }
    
    func test_4() {
        let input = [
            [false, false, false, false],
            [false, false, false, false],
            [false, false, false, false],
            [false, false, false, false]
        ]
        
        print(input.findHowManyArrangement())
    }

}
