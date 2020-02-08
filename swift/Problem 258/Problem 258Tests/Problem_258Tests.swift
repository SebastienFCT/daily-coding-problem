//
//  Problem_258Tests.swift
//  Problem 258Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_258

class Problem_258Tests: XCTestCase {

    
    func test_example() {
        
        let root = Node(value: 1
            , left: Node(value: 2
                , left: Node(value: 4)
                , right: Node(value: 5))
            , right: Node(value: 3
                , left: Node(value: 6)
                , right: Node(value: 7))
        )
        
        let actual = root.boustrophedon()
        let expected = [1, 3, 2, 4, 5, 6, 7]
        
        XCTAssert(actual == expected)
    }

}
