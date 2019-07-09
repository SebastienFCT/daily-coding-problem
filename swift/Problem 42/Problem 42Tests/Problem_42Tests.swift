//
//  Problem_42Tests.swift
//  Problem 42Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_42

class Problem_42Tests: XCTestCase {

    func test_1() {
        let input = [12, 1, 61, 5, 9, 2]
        print(input.subset(forSum: 24, andList: []))
    }

}
