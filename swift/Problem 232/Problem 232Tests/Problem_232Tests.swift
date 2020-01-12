//
//  Problem_232Tests.swift
//  Problem 232Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_232

class Problem_232Tests: XCTestCase {

    func test_prefixMap() {
        
        var pmap = PrefixMap(map: [:])
        
        pmap.insert(key: "x_1", value: 1)
        pmap.insert(key: "x_2", value: 2)
        pmap.insert(key: "x_3", value: 12)
        pmap.insert(key: "x_4", value: 21)
        
        pmap.insert(key: "y_1", value: 3)
        pmap.insert(key: "y_2", value: 7)
        pmap.insert(key: "y_3", value: 33)
        pmap.insert(key: "y_4", value: -1)
        
        XCTAssert(pmap.sum(prefix: "x") == 36)
        XCTAssert(pmap.sum(prefix: "y") == 42)
    }

}
