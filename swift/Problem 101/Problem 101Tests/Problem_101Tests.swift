//
//  Problem_101Tests.swift
//  Problem 101Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_101

class Problem_101Tests: XCTestCase {

    func test_simple() {
        XCTAssert(findPrimeCouple(forValue: 4) == (2, 2))
    }
    
    func test_even_up_to_1000() {
        var i = 2
        
        while i <= 1000 {
            i += 2
            
            let couple = findPrimeCouple(forValue: i)
            XCTAssert(couple.first != 0 && couple.second != 0)
        }
    }

}
