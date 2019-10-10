//
//  Problem_137Tests.swift
//  Problem 137Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-09.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_137

class Problem_137Tests: XCTestCase {

    func test_bitArray() {
        var ba = BitArray(size: 10)
        ba.set(i: 5, val: true)
        print(ba.get(i: 0))
        print(ba.get(i: 5))
        print(ba.get(i: 11))
        ba.set(i: 11, val: true)
        ba.set(i: 0, val: true)
        ba.set(i: 5, val: false)
        print(ba.get(i: 0))
        print(ba.get(i: 5))
        print(ba.get(i: 11))
    }

}
