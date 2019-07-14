//
//  Problem_50Tests.swift
//  Problem 50Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_50

class Problem_50Tests: XCTestCase {

    class Problem_50Tests: XCTestCase {
        
        func test_example() {
            let tree = Node(operation: "*")
            
            let left = Node(operation: "+")
            let right = Node(operation: "+")
            
            let leftleft = Node(value: 3)
            let leftright = Node(value: 2)
            let rightleft = Node(value: 4)
            let rightright = Node(value: 5)
            
            left.left = leftleft
            left.right = leftright
            right.left = rightleft
            right.right = rightright
            
            tree.left = left
            tree.right = right
            
            XCTAssert(tree.getValue() == 45)
        }
        
    }

}
