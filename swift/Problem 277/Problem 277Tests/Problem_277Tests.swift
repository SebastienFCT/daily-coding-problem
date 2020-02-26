//
//  Problem_277Tests.swift
//  Problem 277Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-26.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_277

class Problem_277Tests: XCTestCase {

    func test_utf8_validation() {
        
        XCTAssertTrue([1,1,1,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,1,0,0].isValidUtf8())
        XCTAssertFalse([1,0,0,0,0,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,1,1,0,0].isValidUtf8())
        XCTAssertFalse([1,0].isValidUtf8())
        
    }
}
