//
//  Problem_34Tests.swift
//  Problem 34Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_34

class Problem_34Tests: XCTestCase {
    
    func test_1() {
        let input = "BOB"
        XCTAssertTrue(input.isPalindrome())
    }
    
    func test_2() {
        let input = "alasaka"
        print(input.findLargestPartWithSymetry())
    }
    
    func test_3() {
        let input = "race"
        XCTAssert(buildPalindrome(base: input, part: ("ra", 0)) == "ecarace")
        
        let input2 = "race"
        XCTAssert(buildPalindrome(base: input2, part: ("ce", 2)) == "racecar")
    }
    
    func test_4() {
        let input = "race"
        XCTAssert(input.findPalindrome() == "ecarrace")
    }
}
