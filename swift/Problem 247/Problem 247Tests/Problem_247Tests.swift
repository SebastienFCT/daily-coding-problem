//
//  Problem_247Tests.swift
//  Problem 247Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-27.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_247

class Problem_247Tests: XCTestCase {

    func test_height_balanced_binary_tree() {
        
        
        let root = Node(value: 0)
        
        let l = Node(value: 1)
        
        let ll = Node(value: 11)
        l.left = ll
        root.left = l
        
        let r = Node(value: 2)
        
        let rl = Node(value: 21)
        let rr = Node(value: 22)
        r.left = rl
        r.right = rr
        
        let rrl = Node(value: 221)
        rr.right = rrl
        
        root.right = r
        
        XCTAssertTrue(root.isHeightBalanced())
    }
    
    func test_height_unbalanced_binary_tree() {
        
        
        let root = Node(value: 0)
        
        let l = Node(value: 1)
        
        root.left = l
        
        let r = Node(value: 2)
        
        let rl = Node(value: 21)
        let rr = Node(value: 22)
        
        let rrl = Node(value: 221)
        rr.right = rrl
        
        r.left = rl
        r.right = rr
        
        root.right = r
        
        XCTAssertFalse(root.isHeightBalanced())
    }

}
