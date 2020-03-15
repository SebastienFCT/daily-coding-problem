//
//  Problem_294Tests.swift
//  Problem 294Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_294

class Problem_294Tests: XCTestCase {

    func test_example() {
        
        let elevations: [Int: Int] = [
            0: 5,
            1: 25,
            2: 15,
            3: 20,
            4: 10
        ]
        
        let paths: [(itinerary: (from: Int, to: Int), distance: Int)] = [
            (itinerary: (from: 0, to: 1), distance: 10),
            (itinerary: (from: 0, to: 2), distance: 8),
            (itinerary: (from: 0, to: 3), distance: 15),
            (itinerary: (from: 1, to: 3), distance: 12),
            (itinerary: (from: 2, to: 4), distance: 10),
            (itinerary: (from: 3, to: 4), distance: 5),
            (itinerary: (from: 3, to: 0), distance: 17),
            (itinerary: (from: 4, to: 0), distance: 10),
        ]
        
        let input = Runner(elevations: elevations, paths: paths)
        
        let actual = input.shortestPathAscendingAndThenDescending()
        
        XCTAssert(actual?.locations == [0, 2, 4, 0])
        XCTAssert(actual?.distance == 28)
        
    }

}
