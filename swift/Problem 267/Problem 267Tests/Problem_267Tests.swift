//
//  Problem_267Tests.swift
//  Problem 267Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_267

class Problem_267Tests: XCTestCase {

    func test_example() {
        let input: [[Character]] = [
            [".",".",".","K",".",".",".",".",],
            [".",".",".",".",".",".",".",".",],
            [".","B",".",".",".",".",".",".",],
            [".",".",".",".",".",".","P",".",],
            [".",".",".",".",".",".",".","R"],
            [".",".","N",".",".",".",".",".",],
            [".",".",".",".",".",".",".",".",],
            [".",".",".",".",".","Q",".",".",]
        ]
        
        let actual = input.isKingInCheck()
        print(actual)
    }

}
