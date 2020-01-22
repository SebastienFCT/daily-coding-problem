//
//  Problem_242Tests.swift
//  Problem 242Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-22.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_242

class Problem_242Tests: XCTestCase {

    func test_daily_twitter() {
        
        let dt = DailyTwitter()
        
        XCTAssert(try dt.query(start: 0, end: 24) == 0)
        
        dt.update(hour: 8, value: 10)
        
        XCTAssert(try dt.query(start: 0, end: 24) == 10)
        XCTAssert(try dt.query(start: 9, end: 10) == 0)
        
        dt.update(hour: 8, value: 1)
        
        XCTAssert(try dt.query(start: 0, end: 24) == 11)
        XCTAssert(try dt.query(start: 9, end: 10) == 0)
        
        dt.update(hour: 9, value: 14)
        
        XCTAssert(try dt.query(start: 0, end: 24) == 25)
        XCTAssert(try dt.query(start: 9, end: 10) == 14)
    }

}
