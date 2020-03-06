//
//  Problem_285Tests.swift
//  Problem 285Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_285

class Problem_285Tests: XCTestCase {

    func test_example() {
        let input = Street(buildingHeights: [3, 7, 8, 3, 6, 1])
        
        let expected = 3
        let actual = input.countWithSunSet()
        
        XCTAssert(actual == expected)
    }

}
