//
//  Problem_4Tests.swift
//  Problem 4Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_4

class Problem_4Tests: XCTestCase {

    func testExample() {
        let input = [3, 4, -1, 1]
        
        XCTAssert(input.lowerMissingPositiveInteger() == 2)
    }
    
    func testExample2() {
        let input = [1, 2, 0]
        
        XCTAssert(input.lowerMissingPositiveInteger() == 3)
    }

}
