//
//  Problem_194Tests.swift
//  Problem 194Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_194

class Problem_194Tests: XCTestCase {

    func test_intersection_algorithm() {
        XCTAssert(intersectionsForLines(withStartingPoints: [0, 1, 2, 3], andEndingPoints: [0, 1, 2, 3]) == 0)
        
        XCTAssert(intersectionsForLines(withStartingPoints: [0, 1, 2, 3], andEndingPoints: [0, 1, 3, 2]) == 1)
        
        XCTAssert(intersectionsForLines(withStartingPoints: [0, 1, 2, 3], andEndingPoints: [3, 2, 1, 0]) == 6)
    }

}
