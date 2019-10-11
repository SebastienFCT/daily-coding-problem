//
//  Problem_138Tests.swift
//  Problem 138Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-10.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_138

class Problem_138Tests: XCTestCase {

    func test_example() {
        XCTAssert(CoinDistributor.withdraw(n: 16).count == 3)
    }

}
