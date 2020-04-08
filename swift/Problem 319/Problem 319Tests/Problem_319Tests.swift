//
//  Problem_319Tests.swift
//  Problem 319Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_319

class Problem_319Tests: XCTestCase {

    func test_eight_puzzle_solver() {
        
        
        let input = EightPuzzle(grid: [
            [1, 2, 3],
            [4, 5, 6],
            [7, nil, 8]
        ])
        
        print(input.solutions().first)
    }

}
