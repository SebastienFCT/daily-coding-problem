//
//  Problem_133Tests.swift
//  Problem 133Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_133

class Problem_133Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 10)
        let l = Node(value: 5)
        let r = Node(value: 30)
        let rl = Node(value: 22)
        let rr = Node(value: 35)
        
        root.left = l
        l.parent = root
        
        root.right = r
        r.parent = root
        
        r.left = rl
        rl.parent = r
        
        r.right = rr
        rr.parent = r
        
        XCTAssert(rl.inOrderSuccessor()?.value == 30)
    }

}
