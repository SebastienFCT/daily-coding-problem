//
//  Problem_244Tests.swift
//  Problem 244Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_244

class Problem_244Tests: XCTestCase {

    func test_sieve_or_erastosthenes() {
        
        let soe = SieveOfEratosthenes()
        
        XCTAssert(soe.primes(before: 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97])
    }

}
