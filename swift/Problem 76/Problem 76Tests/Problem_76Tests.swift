//
//  Problem_76Tests.swift
//  Problem 76Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_76

class Problem_76Tests: XCTestCase {

    func test_flip() {
        let input: [[Character]] = [
            ["c", "b", "a"],
            ["d", "a", "f"],
            ["g", "h", "i"]
        ]
        
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().count == 1)
        XCTAssert(input.rowsToRemoveForLexicographicallyOrdered().indexes == [1])
    }

}
