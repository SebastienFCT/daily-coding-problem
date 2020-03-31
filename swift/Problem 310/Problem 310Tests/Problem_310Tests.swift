//
//  Problem_310Tests.swift
//  Problem 310Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-30.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_310

class Problem_310Tests: XCTestCase {

    func test_count_set_bits() {
        
        for i in 0...100 {
            print(i.countSetBits())
        }
    }

}
