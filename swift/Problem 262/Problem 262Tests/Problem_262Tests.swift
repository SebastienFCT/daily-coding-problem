//
//  Problem_262Tests.swift
//  Problem 262Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-11.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_262

class Problem_262Tests: XCTestCase {

    func test_graph_bridges() {
        
        let a = Node(value: 1)
        let b = Node(value: 2)
        let c = Node(value: 3)
        let d = Node(value: 4)
        let e = Node(value: 5)
        
        let input = Graph(
            nodes: [a, b, c, d, e],
            edges: [
                Edge(left: a, right: b),
                Edge(left: b, right: c),
                Edge(left: c, right: d),
                Edge(left: d, right: e),
                Edge(left: e, right: a)
            ]
        )
        
        let actual = input.findBridges()
        
        XCTAssert(actual.count == 5)
        
        for edge in actual {
            print(edge.toString())
        }
    }
    
    func test_graph_bridges_2() {
        
        let a = Node(value: 1)
        let b = Node(value: 2)
        let c = Node(value: 3)
        
        let input = Graph(
            nodes: [a, b, c],
            edges: [
                Edge(left: a, right: b),
                Edge(left: a, right: c),
                Edge(left: b, right: a),
                Edge(left: b, right: c),
                Edge(left: c, right: a),
                Edge(left: c, right: b)
            ]
        )
        
        let actual = input.findBridges()
        
        XCTAssert(actual.count == 0)
        
    }

}
