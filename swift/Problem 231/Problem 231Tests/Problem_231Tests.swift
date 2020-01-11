//
//  Problem_231Tests.swift
//  Problem 231Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_231

class Problem_231Tests: XCTestCase {

    func test_example_1() {
        
        let input = "aaabbc"
        let expected = ["ababca", "ababac", "abacba", "abacab"]
        
        if let output = input.rearrangeWithoutAdjacentDuplicates() as? String {
            print(output)
            XCTAssert(expected.contains(output))
        } else {
            XCTFail("output wasn't a string")
        }
    }
    
    func test_example_2() {
        
        let input = "aaab"
        
        if let output = input.rearrangeWithoutAdjacentDuplicates() as? Bool {
            XCTAssertFalse(output)
        } else {
            XCTFail("output wasn't False")
        }
    }

}
