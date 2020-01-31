//
//  Problem_250Tests.swift
//  Problem 250Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-30.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_250

class Problem_250Tests: XCTestCase {

    func test_example() {
        
        let module = Cryptarithmetic()
        
        print(module.solve3words(word1: "send", word2: "more", word3: "money"))
    }

}
