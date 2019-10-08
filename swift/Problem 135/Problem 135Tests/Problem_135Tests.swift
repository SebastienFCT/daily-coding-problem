//
//  Problem_135Tests.swift
//  Problem 135Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-07.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_135

class Problem_135Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 10)
        
        let l = Node(value: 5)
        root.left = l
        
        let lr = Node(value: 2)
        l.right = lr
        
        let r = Node(value: 5)
        root.right = r
        
        let rr = Node(value: 1)
        r.right = rr
        
        let rrl = Node(value: -1)
        rr.left = rrl
        
        print(root.minPath().map{ $0.value } == [10, 5, 1, -1])
    }

}
