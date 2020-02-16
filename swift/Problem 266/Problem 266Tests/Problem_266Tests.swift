//
//  Problem_266Tests.swift
//  Problem 266Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_266

class Problem_266Tests: XCTestCase {

    func test_example() {
        
        let input = ["APPEAL", "CATS", "DOGS", "APPLES"]
        let actual = input.stepWords(from: "APPLE")
        let expected = ["APPEAL", "APPLES"]
        
        print(actual == expected)
    }

}
