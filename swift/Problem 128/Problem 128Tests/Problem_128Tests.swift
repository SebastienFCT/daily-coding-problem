//
//  Problem_128Tests.swift
//  Problem 128Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_128

class Problem_128Tests: XCTestCase {

    func test_disk_on_top_on_smaller_one() {
        var success = false
        
        let rod1 = HanoiRod()
        
        do {
            _ = try rod1.push(node: HanoiDisk(value: 1))
            _ = try rod1.push(node: HanoiDisk(value: 2))
        } catch {
            success = true
        }
        
        XCTAssert(success)
    }
    
    func test_hanoi_game() {
        let game = HanoiGame(withDisks: 3)
        
        game.move(from: 0, to: 1)
    }
    
    func test_solver() {
        let game = HanoiGame(withDisks: 4)
        game.solve()
    }

}
