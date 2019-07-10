//
//  Problem_46Tests.swift
//  Problem 46Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_46

class Problem_46Tests: XCTestCase {

    func test_1() {
        let a = "abccba"
        XCTAssertTrue(a.isPalindrom())
        
        let b = "abbcca"
        XCTAssertFalse(b.isPalindrom())
    }
    
    func test_2() {
        let a = "abccba"
        XCTAssert(a.anyPalindrome()! == "abccba")
        
        let b = "abbcca"
        XCTAssertNil(b.anyPalindrome())
    }
    
    func test_3() {
        let input1 = "aabcdcb"
        XCTAssert(input1.longestPalindrom() == "bcdcb")
        
        let input2 = "bananas"
        XCTAssert(input2.longestPalindrom() == "anana")
    }

}
