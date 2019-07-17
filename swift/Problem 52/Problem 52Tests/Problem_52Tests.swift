//
//  Problem_52Tests.swift
//  Problem 52Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_52

class Problem_52Tests: XCTestCase {

    func test_1() {
        var lru = LRU(maxSize: 2, cache: [:], root: nil)
        
        XCTAssertNil(lru.get(key: "key1"))
        
        lru.add(node: Node(key: "key1", value: "value1", previous: nil, next: nil))
        XCTAssertNotNil(lru.get(key: "key1"))
        
        lru.add(node: Node(key: "key2", value: "value2", previous: nil, next: nil))
        XCTAssertNotNil(lru.get(key: "key1")) // key 2 is the least use
        
        lru.add(node: Node(key: "key3", value: "value3", previous: nil, next: nil)) // key 2 should be removed from the cache
        XCTAssertNotNil(lru.get(key: "key2"))
    }

}
