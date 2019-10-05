//
//  Problem_132Tests.swift
//  Problem 132Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_132

class Problem_132Tests: XCTestCase {

    func test_hit_counter() {
        var counter = HitCounter(hits: [], limit: 5)
        
        XCTAssert(counter.total() == 0)
        
        counter.record(timestamp: 1450249151)
        
        XCTAssert(counter.total() == 1)
        
        counter.record(timestamp: 1470249151)
        
        XCTAssert(counter.total() == 2)
        
        counter.record(timestamp: 1520249151)
        
        XCTAssert(counter.total() == 3)
        
        counter.record(timestamp: 1540249151)
        
        XCTAssert(counter.total() == 4)
        
        counter.record(timestamp: 1570249151)
        
        XCTAssert(counter.total() == 5)
        XCTAssert(counter.range(lower: 1450249150, upper: 1470249152) == 2)
        
        counter.record(timestamp: 1570249171)
        
        XCTAssert(counter.total() == 5)
        XCTAssert(counter.range(lower: 1450249150, upper: 1470249152) == 1)
    }

}
