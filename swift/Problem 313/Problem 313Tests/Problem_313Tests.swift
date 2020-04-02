//
//  Problem_313Tests.swift
//  Problem 313Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-02.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_313

class Problem_313Tests: XCTestCase {

    func test_lock_count() {
        
        let lock = Lock(code: (0,0,1), deadEnds: [])
        
        let actual = lock.minMoves()
        let expected = 1
        
        XCTAssert(actual == expected)
    }
    
    func test_lock_count2() {
        
        let lock = Lock(code: (0,0,9), deadEnds: [])
        
        let actual = lock.minMoves()
        let expected = 1
        
        XCTAssert(actual == expected)
    }

}
