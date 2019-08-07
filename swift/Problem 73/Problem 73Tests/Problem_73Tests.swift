//
//  Problem_73Tests.swift
//  Problem 73Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_73

class Problem_73Tests: XCTestCase {

    func test_1() {
        let head = Node(value: "A", next: Node(value: "B", next: Node(value: "C", next: Node(value: "D", next: nil))))
        
        var linkedList = LinkedList(head: head)
        linkedList.log()
        
        linkedList.reverse()
        linkedList.log()
    }

}
