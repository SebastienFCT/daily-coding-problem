//
//  Problem_77Tests.swift
//  Problem 77Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_77

class Problem_77Tests: XCTestCase {

    func test_example() {
        var input = tuplesToIntervals(input: [(1, 3), (5, 8), (4, 10), (20, 25)])
        print(intervalsToTuples(input: input.reduceOverlapping()))
    }

}
