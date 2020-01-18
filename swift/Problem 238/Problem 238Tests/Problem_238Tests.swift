//
//  Problem_238Tests.swift
//  Problem 238Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_238

class Problem_238Tests: XCTestCase {

    func test_blackjack() {
        
        let bj = BlackJack()
        
        print("shuffled deck is \(bj.deck)")
        
        let optimal = bj.solve()
        print("optimal path is \(optimal)")
        
        var cardDrawn = 0
        for i in 0..<optimal.count {
            cardDrawn += optimal[i].playerHits + 2
            cardDrawn += optimal[i].dealerHits + 2
        }
        
        print("\(cardDrawn) cards were drawn")
    }

}
