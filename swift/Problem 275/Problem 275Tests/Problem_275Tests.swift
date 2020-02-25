//
//  Problem_275Tests.swift
//  Problem 275Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_275

class Problem_275Tests: XCTestCase {

    func test_example() {
        
        let las = LookAndSee()
        let expected = 1211
        let actual = las.get(n: 4)
        
        XCTAssert(actual == expected)
    }

}
