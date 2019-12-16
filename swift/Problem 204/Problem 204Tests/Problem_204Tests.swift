//
//  Problem_204Tests.swift
//  Problem 204Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_204

class Problem_204Tests: XCTestCase {

    func test_example() {
        
        let root = Node(value: 5
            , left: Node(value: 3
                , left: Node(value: 2)
                , right: Node(value: 4)
            )
            , right: Node(value: 7
                , left: Node(value: 6)
                , right: nil
            )
        )
        
        XCTAssert(root.countNodes() == 6)
    }

}
