//
//  Problem_114Tests.swift
//  Problem 114Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_114

class Problem_114Tests: XCTestCase {

    func test_example_1() {
        XCTAssert("hello/world:here".reverse(withDelimeters: Set(["/", ":"])) == "here/world:hello")
    }
    
    func test_example_2() {
        XCTAssert("hello/world:here/".reverse(withDelimeters: Set(["/", ":"])) == "here/world:hello/")
    }
    
    func test_example_3() {
        XCTAssert("hello//world:here".reverse(withDelimeters: Set(["/", ":"])) == "here//world:hello")
    }

}
