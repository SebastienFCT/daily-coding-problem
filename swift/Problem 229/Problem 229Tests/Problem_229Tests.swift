//
//  Problem_229Tests.swift
//  Problem 229Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-09.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_229

class Problem_229Tests: XCTestCase {

    func test_sal() {
        
        let game = SnakesAndLadders(snakes: [
        16: 6, 48: 26, 49: 11, 56: 53, 62: 19, 64: 60, 87: 24, 93: 73, 95: 75, 98: 78
        ], ladders: [1: 38, 4: 14, 9: 31, 21: 42, 28: 84, 36: 44, 51: 67, 71: 91, 80: 100])
        
        print(game.optimalPath())
    }

}
