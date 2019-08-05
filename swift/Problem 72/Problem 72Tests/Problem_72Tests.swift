//
//  Problem_72Tests.swift
//  Problem 72Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_72

class Problem_72Tests: XCTestCase {

    func test_example_1() {
        let graph = DirectedGraph(nodes: "ABACA", edges: [(0, 1),(0, 2),(2, 3),(3, 4)])
        
        print(graph.findPathValue()!.value == 3)
    }
    
    func test_example_2() {
        let graph = DirectedGraph(nodes: "A", edges: [(0, 0)])
        
        print(graph.findPathValue() == nil)
    }

}
