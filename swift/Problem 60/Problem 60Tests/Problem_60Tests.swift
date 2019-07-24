//
//  Problem_60Tests.swift
//  Problem 60Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_60

class Problem_60Tests: XCTestCase {

    func test_example() {
        let input = [15, 5, 20, 10, 35, 15, 10]
        
        XCTAssert(input.findCoupleSetWithCommonSum() != nil)
    }
    
    func test_example2() {
        let input = [15, 5, 20, 10, 35]
        
        XCTAssert(input.findCoupleSetWithCommonSum() == nil)
    }
    
    func test_obvious() {
        let input = [1,1,2,2]
        
        XCTAssert(input.findCoupleSetWithCommonSum() != nil)
    }
    
    func test_obvious2() {
        let input = [1,2]
        
        XCTAssert(input.findCoupleSetWithCommonSum() == nil)
    }

}
