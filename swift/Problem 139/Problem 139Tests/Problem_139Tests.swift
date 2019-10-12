//
//  Problem_139Tests.swift
//  Problem 139Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_139

class Problem_139Tests: XCTestCase {

    func test_peekable_interface() {
        
        var input = Iterator(items: ["a", 2, 3, "4", 5], currentIndex: 0)
        
        XCTAssert(input.peek() as? Int == 2)
        XCTAssert(input.peek() as? Int == 2)
        input.next()
        input.next()
        XCTAssert(input.peek() as? String == "4")
    }

}
