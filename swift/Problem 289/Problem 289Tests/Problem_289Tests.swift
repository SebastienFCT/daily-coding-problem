//
//  Problem_289Tests.swift
//  Problem 289Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_289

class Problem_289Tests: XCTestCase {

    func test_nim_game() {
        
        XCTAssertFalse(Nim(heap1: 1, heap2: 1, heap3: 1).canWin())
        XCTAssertTrue(Nim(heap1: 2, heap2: 1, heap3: 1).canWin())
        XCTAssertTrue(Nim(heap1: 2, heap2: 2, heap3: 1).canWin())
        XCTAssertTrue(Nim(heap1: 3, heap2: 4, heap3: 5).canWin())
        XCTAssertTrue(Nim(heap1: 1, heap2: 2, heap3: 3).canWin())
        XCTAssertTrue(Nim(heap1: 5, heap2: 5, heap3: 5).canWin())
    }

}
