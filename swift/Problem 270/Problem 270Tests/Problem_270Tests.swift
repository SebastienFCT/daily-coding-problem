//
//  Problem_270Tests.swift
//  Problem 270Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_270

class Problem_270Tests: XCTestCase {

    func test_example() {
        
        let edges: [Edge] = [
            (0, 1, 5),
            (0, 2, 3),
            (0, 5, 4),
            (1, 3, 8),
            (2, 3, 1),
            (3, 5, 10),
            (3, 4, 5)
        ]
        
        let network = Network(length: 5)
        
        let actual = network.shortestPropagationTime(forEdges: edges)
        let expected = 9
        
        XCTAssert(actual == expected)
    }

}
