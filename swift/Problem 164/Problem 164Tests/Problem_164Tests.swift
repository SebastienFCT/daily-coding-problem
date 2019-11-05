//
//  Problem_164Tests.swift
//  Problem 164Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_164

class Problem_164Tests: XCTestCase {

    func test_pigeonhole() {
        XCTAssert([1,2,3,4,5,6,7,7,8].pigeonhole() == 7)
        XCTAssert([101,6345,2,132,45,0,243,2345,2,665,34].pigeonhole() == 2)
    }

}
