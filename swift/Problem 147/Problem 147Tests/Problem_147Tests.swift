//
//  Problem_147Tests.swift
//  Problem 147Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-19.
//  Copyright © 2019 sebfct. All rights reserved.
//

import XCTest
@testable import Problem_147

class Problem_147Tests: XCTestCase {

    func test_custom_sort() {
        let input = [3, 1, 4, 2]
        
        XCTAssert(input.customSort() == [1, 2, 3, 4])
    }

}
