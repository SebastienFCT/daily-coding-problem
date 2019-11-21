//
//  Problem_179Tests.swift
//  Problem 179Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_179

class Problem_179Tests: XCTestCase {

    func test_example() {
        let root = Node.buildTree(postorderedTraversedKeys: [2,4,3,8,7,5])
        
        XCTAssert(root?.value == 5)
        XCTAssert(root?.left?.value == 3)
        XCTAssert(root?.left?.left?.value == 2)
        XCTAssert(root?.left?.right?.value == 4)
        XCTAssert(root?.right?.value == 7)
        XCTAssertNil(root?.right?.left?.value)
        XCTAssert(root?.right?.right?.value == 8)
    }

}
