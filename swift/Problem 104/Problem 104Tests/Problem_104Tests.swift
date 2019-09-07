//
//  Problem_104Tests.swift
//  Problem 104Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_104

class Problem_104Tests: XCTestCase {

    func test_example_1() {
        let node1 = Node(value: 1, previous: nil, next: nil)
        let node2 = Node(value: 4, previous: nil, next: nil)
        let node3 = Node(value: 3, previous: nil, next: nil)
        let node4 = Node(value: 4, previous: nil, next: nil)
        let node5 = Node(value: 1, previous: nil, next: nil)
        
        var linkedList = LinkedList(root: nil)
        linkedList.push(node: node1)
        linkedList.push(node: node2)
        linkedList.push(node: node3)
        linkedList.push(node: node4)
        linkedList.push(node: node5)
        
        XCTAssert(linkedList.isPalindrome() == true)
    }
    
    func test_example_2() {
        let node1 = Node(value: 1, previous: nil, next: nil)
        let node2 = Node(value: 4, previous: nil, next: nil)
        
        var linkedList = LinkedList(root: nil)
        linkedList.push(node: node1)
        linkedList.push(node: node2)
        
        XCTAssert(linkedList.isPalindrome() == false)
    }

}
