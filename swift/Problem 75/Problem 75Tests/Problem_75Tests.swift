//
//  Problem_75Tests.swift
//  Problem 75Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_75

class Problem_75Tests: XCTestCase {

    func test_example() {
        var root = Node(current: [], rest: [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15], candidates: [])
        
        root.buildRootCandidates()
        
        let sorted = root.getAllAscendingSequences().sorted{ $0.count > $1.count }
        if let largest = sorted.first {
            XCTAssert(largest == [0, 2, 6, 9, 11, 15] || largest == [0, 4, 6, 9, 13, 15])
        }
    }

}
