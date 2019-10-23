//
//  Problem_150Tests.swift
//  Problem 150Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_150

class Problem_150Tests: XCTestCase {

    func test_example() {
        let input: [XYPoint] = [(0, 0), (5, 4), (3, 1)]
        
        XCTAssert(input.findNearestPoints(from: (1, 2), limit: 2).count == 2)
        XCTAssert(input.findNearestPoints(from: (1, 2), limit: 2).contains(where: { (point) -> Bool in
            return (point.x == 0 && point.y == 0) || (point.x == 3 && point.y == 1)
        }))
    }

}
