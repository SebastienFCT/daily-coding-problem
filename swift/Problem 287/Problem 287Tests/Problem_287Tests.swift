//
//  Problem_287Tests.swift
//  Problem 287Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_287

class Problem_287Tests: XCTestCase {

    func test_example() {
        
        let input = Web(visits: [
            ("a", 1), ("a", 3), ("a", 5),
            ("b", 2), ("b", 6),
            ("c", 1), ("c", 2), ("c", 3), ("c", 4), ("c", 5),
            ("d", 4), ("d", 5), ("d", 6), ("d", 7),
            ("e", 1), ("e", 3), ("e", 5), ("e", 6)
        ])
        
        let actual = input.topSimilarities(forPairCount: 1)
        
        XCTAssert(actual.contains(where: { (val) -> Bool in
            (val.left == "e" && val.right == "a") || (val.left == "a" && val.right == "e")
        }))
    }

}
