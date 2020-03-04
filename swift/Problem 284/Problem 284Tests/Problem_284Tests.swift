//
//  Problem_284Tests.swift
//  Problem 284Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_284

class Problem_284Tests: XCTestCase {

    func test_example() {
        
        let root = Node(value: 1)
        let l = Node(value: 2)
        let r = Node(value: 3)
        let ll = Node(value: 4)
        let lr = Node(value: 5)
        let rr = Node(value: 6)
        
        r.right = rr
        
        l.left = ll
        l.right = lr
        
        root.left = l
        root.right = r
        
        var bt = BinaryTree(root: root, nodesByLevel: [:])
        bt.buildNodesByLevel()
        
        let actual = bt.cousin(of: ll).map{ $0.value }
        let expected = [6]
        
        XCTAssert(actual == expected)
    }

}
