//
//  Problem_226Tests.swift
//  Problem 226Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-06.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_226

class Problem_226Tests: XCTestCase {

    func test_example() {
        
        var language = Language(nodes: [], root: nil, compared: [])
        language.process(words: ["xww", "wxyz", "wxyw", "ywx", "ywz"])
        
        let expected = "x->z->w->y"
        let actual = language.root?.printableTree()
        
        XCTAssert(actual == expected)
    }

}
