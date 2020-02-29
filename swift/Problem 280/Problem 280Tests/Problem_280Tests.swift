//
//  Problem_280Tests.swift
//  Problem 280Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-29.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_280

class Problem_280Tests: XCTestCase {

    func test_graph_cycle() {
        
        let a = Node(value: 0)
        let b = Node(value: 1)
        let c = Node(value: 2)
        
        a.nodes = [b]
        b.nodes = [c]
        c.nodes = [a]
        
        XCTAssertTrue(a.containsCycle(current: []))
        
        let a2 = Node(value: 0)
        let b2 = Node(value: 1)
        let c2 = Node(value: 2)
        
        a2.nodes = [b2]
        b2.nodes = [c2]
        
        XCTAssertFalse(a2.containsCycle(current: []))
    }

}
