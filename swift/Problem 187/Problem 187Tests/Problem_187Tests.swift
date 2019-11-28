//
//  Problem_187Tests.swift
//  Problem 187Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_187

class Problem_187Tests: XCTestCase {

    func test_example() {
        let input: [Rectangle] = [Rectangle(top_left: (1,4), dimensions: (3,3)), Rectangle(top_left: (-1,3), dimensions: (2,1)), Rectangle(top_left: (0,5), dimensions: (4,3))]
        XCTAssertTrue(input.intersect())
    }

}
