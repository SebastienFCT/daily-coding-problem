//
//  Problem_48Tests.swift
//  Problem 48Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_48

class Problem_48Tests: XCTestCase {

    func test_example() {
        let preorder = ["a", "b", "d", "e", "c", "f", "g"]
        let inorder = ["d", "b", "e", "a", "f", "c", "g"]
        
        var instance = GoogleChallenge(preorder: preorder, inorder: inorder, root: nil)
        instance.root = instance.buildChildren(children: [], preorder: instance.preorder.toNodes())[0]
        
        XCTAssert(instance.root?.value == "a")
        XCTAssert(instance.root?.left?.value == "b")
        XCTAssert(instance.root?.right?.value == "c")
        XCTAssert(instance.root?.left?.left?.value == "d")
        XCTAssert(instance.root?.left?.right?.value == "e")
        XCTAssert(instance.root?.right?.left?.value == "f")
        XCTAssert(instance.root?.right?.right?.value == "g")
    }

}

/**
 
 ```
     a
    / \
   b   c
  / \ / \
 d  e f  g

 ```
 
 */
