//
//  Problem_87Tests.swift
//  Problem 87Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_87

class Problem_87Tests: XCTestCase {

    func test_example() {
        var ds = UberChallenge(allPos: [])
        print(ds.addRule(rule: "A N B"))
        print(ds.addRule(rule: "B NE C"))
        print(ds.addRule(rule: "C N A"))
    }

}
