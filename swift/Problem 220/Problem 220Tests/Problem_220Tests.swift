//
//  Problem_220Tests.swift
//  Problem 220Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-31.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_220

class Problem_220Tests: XCTestCase {

    func test_the_coin_game() {
        
        let game = TheCoinGame(coins: [1,2,3,4,5,6,7,8,9,10])
        print(game.maximum())
    }

}
