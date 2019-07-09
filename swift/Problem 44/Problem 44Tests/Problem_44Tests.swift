//
//  Problem_44Tests.swift
//  Problem 44Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_44

class Problem_44Tests: XCTestCase {

    func test_1() {
        var input = [3,1,5,2]
        print(input.countOutOfOrder())
    }

    func test_example_1() {
        var input = [2, 4, 1, 3, 5]
        print(input.countOutOfOrder())
    }
    
    func test_example_2() {
        var input = [5, 4, 3, 2, 1]
        print(input.countOutOfOrder())
    }

}
