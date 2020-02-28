//
//  Problem_278Tests.swift
//  Problem 278Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-27.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_278

class Problem_278Tests: XCTestCase {

    func test_all_trees() {
        
        let bst = BinarySearchTree()
        
        for tree in bst.allTrees(n: 5) {
            print(tree.printable())
        }
    }

}
