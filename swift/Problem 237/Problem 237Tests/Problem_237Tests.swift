//
//  Problem_237Tests.swift
//  Problem 237Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-17.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_237

class Problem_237Tests: XCTestCase {

    func test_symetric_tree() {
        
        let root = Node(value: 4)
        
        let c1 = Node(value: 3)
        let c2 = Node(value: 5)
        let c3 = Node(value: 3)
        
        let cc1 = Node(value: 1)
        let cc2 = Node(value: 2)
        let cc3 = Node(value: 1)
        
        let cc4 = Node(value: 4)
        let cc5 = Node(value: 5)
        let cc6 = Node(value: 4)
        
        let cc7 = Node(value: 1)
        let cc8 = Node(value: 2)
        let cc9 = Node(value: 1)
        
        c1.children = [cc1, cc2, cc3]
        c2.children = [cc4, cc5, cc6]
        c3.children = [cc7, cc8, cc9]
        root.children = [c1, c2, c3]
        
        XCTAssertTrue(root.isSymmetric())
    }
    
    func test_asymetric_tree() {
        
        let root = Node(value: 4)
        
        let c1 = Node(value: 3)
        let c2 = Node(value: 2)
        let c3 = Node(value: 1)
        
        let cc1 = Node(value: 1)
        let cc2 = Node(value: 2)
        let cc3 = Node(value: 3)
        
        let cc4 = Node(value: 4)
        let cc5 = Node(value: 12)
        let cc6 = Node(value: 4)
        
        let cc7 = Node(value: -90)
        let cc8 = Node(value: 2)
        let cc9 = Node(value: 1)
        
        c1.children = [cc1, cc2, cc3]
        c2.children = [cc4, cc5, cc6]
        c3.children = [cc7, cc8, cc9]
        root.children = [c1, c2, c3]
        
        XCTAssertFalse(root.isSymmetric())
    }

}
