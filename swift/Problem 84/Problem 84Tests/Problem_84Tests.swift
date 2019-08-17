//
//  Problem_84Tests.swift
//  Problem 84Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_84

class Problem_84Tests: XCTestCase {

    func test_example() {
        let input = [
            [1,0,0,0,0],
            [0,0,1,1,0],
            [0,1,1,0,0],
            [0,0,0,0,0],
            [1,1,0,0,1],
            [1,1,0,0,1]
        ]
        
        input.countIslands()
    }

}
