//
//  Problem_239Tests.swift
//  Problem 239Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-19.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_239

class Problem_239Tests: XCTestCase {

    func test_android_screen_lock() {
        
        let asl = AndroidScreenLock()
        
        XCTAssert(asl.totalPossibilities(length: 1) == 9)
        
        print(asl.totalPossibilities(length: 2))
        print(asl.totalPossibilities(length: 3))
        print(asl.totalPossibilities(length: 4))
        print(asl.totalPossibilities(length: 5))
        print(asl.totalPossibilities(length: 6))
        print(asl.totalPossibilities(length: 7))
        print(asl.totalPossibilities(length: 8))
        print(asl.totalPossibilities(length: 9))
    }

}
