//
//  Problem_339Tests.swift
//  Problem 339Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-28.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_339

class Problem_339Tests: XCTestCase {

    func test_example() {
        
        let input = [20, 303, 3, 4, 25]
        
        XCTAssertTrue(input.countainsTrio(withSum: 49))
        XCTAssertFalse(input.countainsTrio(withSum: 50))
    }

}
