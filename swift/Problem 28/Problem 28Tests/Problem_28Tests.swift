//
//  Problem_28Tests.swift
//  Problem 28Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_28

class Problem_28Tests: XCTestCase {

    func test_1() {
        let input = ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
        let length = 16
        
        XCTAssert(input.justify(withMaxLength: length) == [["the  ", "quick ", "brown"], ["fox  ", "jumps  ", "over"], ["the   ", "lazy   ", "dog"]])
    }
    
    func test_2() {
        let input = ["test"]
        let length = 16
        
        XCTAssert(input.justify(withMaxLength: length) == [["test            "]])
    }

}
