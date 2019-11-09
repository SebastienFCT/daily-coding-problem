//
//  Problem_168Tests.swift
//  Problem 168Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_168

class Problem_168Tests: XCTestCase {

    func test_example() {
        var input = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        
        input.rotate90()
        print(input)
    }

}
