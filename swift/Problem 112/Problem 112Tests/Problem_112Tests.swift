//
//  Problem_112Tests.swift
//  Problem 112Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_112

class Problem_112Tests: XCTestCase {

    func test_parents_function() {
        let root = Node(value: 0)
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        let node4 = Node(value: 4)
        let node5 = Node(value: 5)
        let node6 = Node(value: 6)
        let node7 = Node(value: 7)
        let node8 = Node(value: 8)
        
        root.setLeftChild(node: node1)
        node1.setLeftChild(node: node3)
        node1.setRightChild(node: node4)
        
        root.setRightChild(node: node2)
        node2.setLeftChild(node: node5)
        node2.setRightChild(node: node6)
        
        node6.setLeftChild(node: node7)
        node7.setRightChild(node: node8)
        
        let node8Parents = node8.parents(base: [])
        XCTAssert(node8Parents.map{ $0.value } == [8, 7, 6, 2, 0])
    }
    
    func test_function_lca() {
        let root = Node(value: 0)
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node11 = Node(value: 11)
        let node12 = Node(value: 12)
        let node21 = Node(value: 21)
        let node22 = Node(value: 22)
        let node211 = Node(value: 211)
        let node212 = Node(value: 212)
        
        root.setLeftChild(node: node1)
        node1.setLeftChild(node: node11)
        node1.setRightChild(node: node12)
        root.setRightChild(node: node2)
        node2.setLeftChild(node: node21)
        node2.setRightChild(node: node22)
        node21.setLeftChild(node: node211)
        node21.setRightChild(node: node212)
        
        XCTAssert(node212.lca(with: node211)!.value == 21)
        XCTAssert(node22.lca(with: node212)!.value == 2)
    }

}
