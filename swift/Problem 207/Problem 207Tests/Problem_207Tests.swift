//
//  Problem_207Tests.swift
//  Problem 207Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_207

class Problem_207Tests: XCTestCase {
    
    func test_bipartite_graph() {
        let a = Node(value: "a")
        let b = Node(value: "b")
        let c = Node(value: "c")
        let d = Node(value: "d")
        
        
        a.connections = [b]
        b.connections = [c]
        c.connections = [d]
        d.connections = [a]
        
        XCTAssertTrue(a.isBipartite())
    }

    func test_non_bipartitte_graph() {
        let a = Node(value: "a")
        let b = Node(value: "b")
        let c = Node(value: "c")
        let d = Node(value: "d")
        
        
        a.connections = [b]
        b.connections = [c,d]
        c.connections = [d]
        d.connections = [a]
        
        XCTAssertFalse(a.isBipartite())
    }

}
