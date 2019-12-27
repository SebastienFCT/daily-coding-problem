//
//  Problem_215Tests.swift
//  Problem 215Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_215

class Problem_215Tests: XCTestCase {

    func test_example() {
        let root = Node(value: 5)
        
        let l = Node(value: 3)
        root.left = l
        
        let ll = Node(value: 1)
        l.left = ll
        let llr = Node(value: 4)
        ll.right = llr
        
        let lll = Node(value: 0)
        ll.left = lll
        
        let r = Node(value: 7)
        root.right = r
        
        let rl = Node(value: 6)
        r.left = rl
        
        let rr = Node(value: 9)
        r.right = rr
        
        let rrl = Node(value: 8)
        rr.left = rrl
        
        let actual = root.bottomViews()
        let expected1 = [0, 1, 3, 6, 8, 9]
        let expected2 = [0, 1, 4, 6, 8, 9]
        
        XCTAssert(actual == expected1 || actual == expected2)
    }

}
