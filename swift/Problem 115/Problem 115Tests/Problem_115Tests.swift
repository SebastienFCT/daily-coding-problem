//
//  Problem_115Tests.swift
//  Problem 115Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_115

class Problem_115Tests: XCTestCase {

    func test_node_inclusion() {
        let root = Node(value: "root")
        
        let l = Node(value: "l")
        root.left = l
        
        let ll = Node(value: "ll")
        l.left = ll
        let lr = Node(value: "lr")
        l.right = lr
        let lll = Node(value: "lll")
        ll.left = lll
        let llr = Node(value: "llr")
        ll.right = llr
        
        let r = Node(value: "r")
        root.right = r
        
        XCTAssertTrue(root.includes(node: lr))
    }
    
    func test_node_non_inclusion() {
        let root = Node(value: "root")
        
        let l = Node(value: "l")
        root.left = l
        
        let ll = Node(value: "ll")
        l.left = ll
        let lr = Node(value: "lr")
        l.right = lr
        let lll = Node(value: "lll")
        ll.left = lll
        let llr = Node(value: "llr")
        ll.right = llr
        
        let r = Node(value: "r")
        root.right = r
        
        let otherNode = Node(value: "test", left: Node(value: "testLeft"), right: Node(value: "testRight"))
        
        XCTAssertFalse(root.includes(node: otherNode))
    }

}
