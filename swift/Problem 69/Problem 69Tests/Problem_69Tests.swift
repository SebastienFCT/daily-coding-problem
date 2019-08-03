//
//  Problem_69Tests.swift
//  Problem 69Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_69

class Problem_69Tests: XCTestCase {

    func test_example() {
        let input = [-10, -10, 5, 2]
        
        XCTAssert(input.winningTrio() == 500)
    }

}
 
