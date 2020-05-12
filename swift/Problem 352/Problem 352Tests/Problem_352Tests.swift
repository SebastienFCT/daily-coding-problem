//
//  Problem_352Tests.swift
//  Problem 352Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_352

class Problem_352Tests: XCTestCase {

    func test_crossword_grid() {
        
        let grid1: [[Character]] = [
            ["_", "_", " ", " ", " ", "_", "_"],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " ", " "],
            ["_", "_", " ", " ", " ", "_", "_"]
        ]
        
        XCTAssertTrue(grid1.isValidCrosswordGrid())
        
        let grid2: [[Character]] = [
            ["_", "_", " ", " ", "_", "_"],
            [" ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " ", " "],
            ["_", "_", " ", " ", "_", "_"]
        ]
        
        // on the first and last row words are less than 3
        XCTAssertFalse(grid2.isValidCrosswordGrid())
        
        let grid3: [[Character]] = [
            ["_", "_", " ", "_", "_"],
            [" ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " "],
            [" ", " ", " ", " ", " "],
            ["_", "_", " ", "_", "_"]
        ]
        
        XCTAssertFalse(grid3.isValidCrosswordGrid())
    }

}
