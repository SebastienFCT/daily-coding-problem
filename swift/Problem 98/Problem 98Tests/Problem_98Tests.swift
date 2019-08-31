//
//  Problem_98Tests.swift
//  Problem 98Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-31.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_98

class Problem_98Tests: XCTestCase {

    func test_example() {
        let matrix: [[Character]] = [
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ]
        
        XCTAssertTrue(matrix.exists(word: "ABCCED"))
        XCTAssertTrue(matrix.exists(word: "SEE"))
        XCTAssertFalse(matrix.exists(word: "ABCB"))
    }

}
