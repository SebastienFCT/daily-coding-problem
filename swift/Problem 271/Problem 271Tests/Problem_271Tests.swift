//
//  Problem_271Tests.swift
//  Problem 271Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-20.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_271

class Problem_271Tests: XCTestCase {

    func test_quick_contains() {
        
        let input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        
        for i in 1...10 {
            let actual = input.quickContains(value: i)
            
            XCTAssertTrue(actual)
        }
    }

}
