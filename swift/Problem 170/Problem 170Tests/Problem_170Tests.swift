//
//  Problem_170Tests.swift
//  Problem 170Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_170

class Problem_170Tests: XCTestCase {

    func test_example() {
        let dictionary = [1: "dot", 2: "dop", 3: "dat", 4: "cat"]
        XCTAssert(dictionary.transformation(from: "dog", to: "cat", previousTransformations: []) == ["dot", "dat", "cat"])
        
        let dictionary2 = [1: "dot", 2: "tod", 3: "dat", 4: "dar"]
        XCTAssertNil(dictionary2.transformation(from: "dog", to: "cat", previousTransformations: []))
    }

}
