//
//  Problem_78Tests.swift
//  Problem 78Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-11.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_78

class Problem_78Tests: XCTestCase {

    func test_insert() {
        let root = Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: nil)))
        let sortedLinkedList = SortedLinkedList(root: root)
        XCTAssert(sortedLinkedList.toString() == "(1)->(2)->(3)")
        
        sortedLinkedList.insert(node: Node(value: 2))
        XCTAssert(sortedLinkedList.toString() == "(1)->(2)->(2)->(3)")
    }
    
    func test_merge() {
        let root = Node(value: 1, next: Node(value: 3, next: Node(value: 5, next: nil)))
        let sortedLinkedList = SortedLinkedList(root: root)
        
        let root2 = Node(value: 2, next: Node(value: 4, next: Node(value: 6, next: nil)))
        let sortedLinkedList2 = SortedLinkedList(root: root2)
        
        sortedLinkedList.merge(list: sortedLinkedList2)
        XCTAssert(sortedLinkedList.toString() == "(1)->(2)->(3)->(4)->(5)")
    }

}
