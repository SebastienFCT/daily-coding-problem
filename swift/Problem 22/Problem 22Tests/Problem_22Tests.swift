//
//  Problem_22Tests.swift
//  Problem 22Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_22

class Problem_22Tests: XCTestCase {

    // Ok, let's put this all together:
    // We create an node with an empty string as initial value, we set its possibilities
    
    func testExample() {
        let root = Node(possibilities: ["quick", "brown", "the", "fox"], values: [], rest: "thequickbrownfox")
        root.buildChildren()
        
        XCTAssert(root.findPath()! == ["the", "quick", "brown", "fox"])
    }
    
    func testExample2() {
        let root = Node(possibilities: ["bed", "bath", "bedbath", "and", "beyond"], values: [], rest: "bedbathandbeyond")
        root.buildChildren()
        
        XCTAssert((root.findPath()! == ["bed", "bath", "and", "beyond"]) || (root.findPath()! == ["bedbath", "and", "beyond"]))
    }

}
