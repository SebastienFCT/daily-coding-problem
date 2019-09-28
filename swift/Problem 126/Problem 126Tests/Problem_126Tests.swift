//
//  Problem_126Tests.swift
//  Problem 126Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_126

class Problem_126Tests: XCTestCase {

    func test_example() {
        var input = [1, 2, 3, 4, 5, 6]
        
        XCTAssert(input.rotate(by: 2) == [3, 4, 5, 6, 1, 2])
    }

}
