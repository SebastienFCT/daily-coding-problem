//
//  Problem_178Tests.swift
//  Problem 178Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_178

class Problem_178Tests: XCTestCase {

    func test_example() {
        // I expected the game to result in the exact same probabilities however the program seems to constantly get an average of 36 or 37 rolls required for the first game versus 42 or 43 rolls required for the second game (for 100000 samples)
        print(Alice_s_Choice.averageForRoll(toValue: 5, followedBy: 6, sampleSize: 100000))
        print(Alice_s_Choice.averageForRoll(toValue: 5, followedBy: 5, sampleSize: 100000))
    }

}
