//
//  Problem_182Tests.swift
//  Problem 182Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_182

class Problem_182Tests: XCTestCase {

    func test_minimally_connected_true() {
        
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        node1.children = [node2]
        node2.children = [node3]
        node3.children = [node1]
        
        XCTAssertTrue(node1.isMinimallyConnected())
    }
    
    func test_minimally_connected_false() {
        
        let root = Node(value: 1)
        
        let l = Node(value: 2)
        let r = Node(value: 3)
        root.children = [l, r]
        
        let ll = Node(value: 4)
        let lr = Node(value: 5)
        l.children = [ll, lr]
        
        let rr = Node(value: 6)
        r.children = [rr]
        
        XCTAssertFalse(root.isMinimallyConnected())
    }

}
