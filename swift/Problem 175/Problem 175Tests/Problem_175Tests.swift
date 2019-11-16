//
//  Problem_175Tests.swift
//  Problem 175Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-16.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_175

class Problem_175Tests: XCTestCase {

    func test_example() {
        let input: [MarkovState] = [
          ("a", "a", 0.9),
          ("a", "b", 0.075),
          ("a", "c", 0.025),
          ("b", "a", 0.15),
          ("b", "b", 0.8),
          ("b", "c", 0.05),
          ("c", "a", 0.25),
          ("c", "b", 0.25),
          ("c", "c", 0.5)
        ]
        
        print(input.compute(start: "a", steps: 5000))
    }

}
