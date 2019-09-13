//
//  Problem_111Tests.swift
//  Problem 111Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-13.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_111

class Problem_111Tests: XCTestCase {

    func test_example() {
        XCTAssert("abxaba".indexesForAnagrams(of: "ab") == [0, 3, 4])
    }

}
