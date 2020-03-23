//
//  Problem_303Tests.swift
//  Problem 303Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-23.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_303

class Problem_303Tests: XCTestCase {

    func test_example() {
        
        let input = Clock(time: "12:12")
        
        print(input.angle())
        print(Clock.zeroAngles())
    }

}
