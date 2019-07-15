//
//  Problem_51Tests.swift
//  Problem 51Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_51

class Problem_51Tests: XCTestCase {

    func test_shuffling() {
        var deck: [Int] = []
        for i in 1...52 {
            deck.append(i)
        }
        
        deck.shuffleDeck()
        print(deck)
    }

}
