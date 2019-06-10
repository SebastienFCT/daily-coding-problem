//
//  Problem_3Tests.swift
//  Problem 3Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_3

class Problem_3Tests: XCTestCase {

    func testExample() {
        let node = Node("root", Node("left", Node("left.left")), Node("right"))
        
        let serialized = node.serialize()
        var splitted = serialized.split(separator: " ").map(String.init)
        let deserialized = splitted.deserialize()
        
        if let value = deserialized?.left?.left?.val {
            XCTAssert(value == "left.left")
        } else {
            XCTFail()
        }
    }
}
