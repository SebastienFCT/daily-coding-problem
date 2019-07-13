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
        instance.buildTree()
        
        print(instance.root?.value)
        print(instance.root?.left?.value)
        print(instance.root?.right?.value)
        print(instance.root?.left?.left?.value)
        print(instance.root?.left?.right?.value)
        print(instance.root?.right?.left?.value)
        print(instance.root?.right?.right?.value)
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
