//
//  Problem_97Tests.swift
//  Problem 97Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_97

class Problem_97Tests: XCTestCase {

    func test_1() {
        var td = TimedDictionary(map: [:])
        
        td.set(key: "1", value: 1, time: 0)
        td.set(key: "1", value: 2, time: 2)
        XCTAssert(td.get(key: "1", time: 1) == 1)
        XCTAssert(td.get(key: "1", time: 3) == 2)
    }
    
    func test_2() {
        var td = TimedDictionary(map: [:])
        
        td.set(key: "1", value: 1, time: 5)
        XCTAssert(td.get(key: "1", time: 0) == nil)
        XCTAssert(td.get(key: "1", time: 10) == 1)
    }
    
    func test_3() {
        var td = TimedDictionary(map: [:])
        
        td.set(key: "1", value: 1, time: 0)
        td.set(key: "1", value: 2, time: 0)
        XCTAssert(td.get(key: "1", time: 0) == 2)
    }

}
