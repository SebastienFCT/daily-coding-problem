//
//  Problem_24Tests.swift
//  Problem 24Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_24

class Problem_24Tests: XCTestCase {

    func testExample() {
        let root = Node(parent: nil)
        let left = Node(parent: root)
        let right = Node(parent: root)
        let leftleft = Node(parent: left)
        let leftleftleft = Node(parent: leftleft)
        
        root.left = left
        left.left = leftleft
        root.right = right
        leftleft.left = leftleftleft
        
        // I should be able to lock the root since nothing is locked yet
        XCTAssertTrue(root.lock())
        
        // Leftleft should not be lockable since the root is locked
        XCTAssertFalse(leftleft.lock())
        
        // Unlock root & Lock left
        _ = root.unlock()
        _ = left.lock()
        
        // Right should be lockable since no child nor parent are locked
        XCTAssertTrue(right.lock())
        
    }

}
