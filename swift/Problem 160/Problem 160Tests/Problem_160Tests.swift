//
//  Problem_160Tests.swift
//  Problem 160Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-01.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_160

class Problem_160Tests: XCTestCase {

    func test_example() {
        let root = Node(value: "a", weight: 0, children: [
            Node(value: "b", weight: 3, children: []),
            Node(value: "c", weight: 5, children: []),
            Node(value: "d", weight: 8, children: [
                Node(value: "e", weight: 2, children: [
                    Node(value: "g", weight: 1, children: []),
                    Node(value: "h", weight: 1, children: [])
                ]),
                Node(value: "f", weight: 4, children: [])
            ])
        ])
        
        print(root.longestPath()?.totalWeight)
    }

}
