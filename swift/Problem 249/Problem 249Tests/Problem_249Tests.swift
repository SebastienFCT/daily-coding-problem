//
//  Problem_249Tests.swift
//  Problem 249Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-29.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_249

class Problem_249Tests: XCTestCase {

    func test_xOrCount() {
        
        let input = [0, 1, 2, 3, 4]
        
        let actual = input.xOrCount()
        let expected = 0
        
        XCTAssert(actual == expected)
    }
    
    func test_xOrCount_2() {
        
        let input = [0, 1, 1, 1, 1]
        
        let actual = input.xOrCount()
        let expected = 3
        
        print(actual)
        XCTAssert(actual == expected)
    }

}
