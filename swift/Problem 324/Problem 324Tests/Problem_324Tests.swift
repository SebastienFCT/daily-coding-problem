//
//  Problem_324Tests.swift
//  Problem 324Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_324

class Problem_324Tests: XCTestCase {

    func test_example() {
        
        let input = Amazon(mouses: [1, 4, 9, 15], holes: [10, -5, 0, 16])
        
        let actual = input.maxMoveCountToHide()
        let expected = 6
        
        XCTAssert(actual == expected)
    }

}
