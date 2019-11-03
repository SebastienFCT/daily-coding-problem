//
//  Problem_162Tests.swift
//  Problem 162Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_162

class Problem_162Tests: XCTestCase {

    func test_example() {
        let prefixGenerator = SquareChallenge(input: ["dog", "cat", "apple", "apricot", "fish"])
        print(prefixGenerator.log())
    }

}
