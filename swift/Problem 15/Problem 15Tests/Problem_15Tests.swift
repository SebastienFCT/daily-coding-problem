//
//  Problem_15Tests.swift
//  Problem 15Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_15

class Problem_15Tests: XCTestCase {

    func testExample() {
        var random = Random()
        let max = 30
        
        for i in 0..<max {
            print("After reading \(i) value(s). Random = \(random.selectRandom(x: i))")
        }
    }

}
