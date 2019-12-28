//
//  Problem_217Tests.swift
//  Problem 217Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_217

class Problem_217Tests: XCTestCase {

    func test_binary_converter() {
        print(123.toBinary())
        print([1, 1, 1, 1, 0, 1, 1].binaryToInt())
    }
    
    func test_is_sparse() {
        print([1, 1, 1, 1, 0, 1, 1].isSparse())
        print([1, 0, 0, 0, 0, 0, 1].isSparse())
        print([1, 0, 1].isSparse())
    }
    
    func test_example() {
        let input = 21
        let expected = 21
        let actual = input.nextSparse()
        
        XCTAssert(actual == expected)
    }
    
    func test_example_2() {
        let input = 22
        let actual = input.nextSparse()
        
        XCTAssert(actual != 22)
    }

}
