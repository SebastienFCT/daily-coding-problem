//
//  Problem_344Tests.swift
//  Problem 344Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_344

class Problem_344Tests: XCTestCase {

    func test_example() {
        let input = Node(value: 1, children: [
            Node(value: 2, children: []),
            Node(value: 3, children: [
                Node(value: 4, children: [
                    Node(value: 6, children: []),
                    Node(value: 7, children: []),
                    Node(value: 8, children: [])
                ]),
                Node(value: 5, children: [])
            ]),
        ])
        
        let actual = input.maxEdgeCutWithEvenSubtrees()
        let expected = 2
        
        XCTAssert(actual == expected)
    }

}
