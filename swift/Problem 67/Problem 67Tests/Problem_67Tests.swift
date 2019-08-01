//
//  Problem_67Tests.swift
//  Problem 67Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-31.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_67

class Problem_67Tests: XCTestCase {

    func test_cache() {
        var cache = Cache(size: 3, existing: [:], leastUsed: nil)
        
        XCTAssert(cache.get(key: "first") == nil)
        
        let firstNode = Node(key: "first", value: "first_value", previous: nil, next: nil)
        cache.add(node: firstNode)
        XCTAssert(cache.get(key: "first")!.value == firstNode.value)
        
        let secondNode = Node(key: "second", value: "second_value", previous: nil, next: nil)
        cache.add(node: secondNode)
        XCTAssert(cache.get(key: "second")!.value == secondNode.value)
        
        // Because we just checked the second node, it becomes the more recently used
        XCTAssert(cache.leastUsed!.value == secondNode.value)
        
        // Because we just checked the first node, it becomes the more recently used
        cache.get(key: "first")
        XCTAssert(cache.leastUsed!.value == firstNode.value)
    }

}
