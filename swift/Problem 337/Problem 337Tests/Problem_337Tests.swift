//
//  Problem_337Tests.swift
//  Problem 337Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-26.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_337

class Problem_337Tests: XCTestCase {

    func test_linkedlist_uniform_shuffle() {
        
        var ll = LinkedList(root: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4, next: Node(value: 5, next: nil))))))
        
        print(ll.root.toString())
        ll.uniformShuffle()
        print(ll.root.toString())
    }

}
