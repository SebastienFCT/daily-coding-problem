//
//  Problem_68Tests.swift
//  Problem 68Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_68

class Problem_68Tests: XCTestCase {

    func test_diagonals() {
        let input = [
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0],
            [0, 0, 0, 0]
        ]
        
        print(input.diagonals(position: (2, 2)))
    }

    func test_example() {
        let board = [
            [1,0,0,0,0],
            [0,0,1,0,0],
            [0,0,1,0,0],
            [0,0,0,0,0],
            [1,0,0,0,0]
        ]
        
        let bishopWar = BishopWar(board: board)
        XCTAssert(bishopWar.bishopConflictCount() == 2)
    }
}
