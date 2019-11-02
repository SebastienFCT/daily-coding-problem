//
//  Problem_161Tests.swift
//  Problem 161Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_161

class Problem_161Tests: XCTestCase {

    func test_bit_reserver() {
        print(UInt32(8).reverseBits() == UInt32(268435456))
    }

}
