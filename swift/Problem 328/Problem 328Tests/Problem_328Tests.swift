//
//  Problem_328Tests.swift
//  Problem 328Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-17.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_328

class Problem_328Tests: XCTestCase {

    func test_elo() {
        
        var elo = Elo(players: [], minRank: 100)
        
        _ = elo.addPlayer(username: "sebastien")
        _ = elo.addPlayer(username: "john_doe")
        _ = elo.addPlayer(username: "jane_doe")
        _ = elo.addPlayer(username: "johny_doe")
        
        for _ in 0...100 {
            let rand1 = Int.random(in: 0...3)
            let rand2 = Int.random(in: 0...3)
            
            if rand1 != rand2 {
                elo.simulateWin(fromUserAtIndex: rand1, againstUserAtIndex: rand2)
                print(elo.score())
            }
        }
    }

}
