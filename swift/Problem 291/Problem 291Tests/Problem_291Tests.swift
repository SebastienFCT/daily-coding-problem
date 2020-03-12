//
//  Problem_291Tests.swift
//  Problem 291Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_291

class Problem_291Tests: XCTestCase {

    func test_example() {
        
        let input = Hurricane(population: [100, 200, 150, 80])
        
        let actual = input.minBoats(withMaxWeightPerPerson: 200)
        let expected = 3
        
        XCTAssert(actual == expected)
    }

}
