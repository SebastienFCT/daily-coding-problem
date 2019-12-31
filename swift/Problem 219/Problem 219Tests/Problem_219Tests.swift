//
//  Problem_219Tests.swift
//  Problem 219Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_219

class Problem_219Tests: XCTestCase {

    func test_red_win_horizontally() {
        var game = Connect4()
        
        try? game.drop(type: .red, column: 0)
        try? game.drop(type: .red, column: 1)
        try? game.drop(type: .red, column: 2)
        try? game.drop(type: .red, column: 3)
    }

    func test_black_win_vertically() {
        var game = Connect4()
        
        try? game.drop(type: .black, column: 0)
        try? game.drop(type: .black, column: 0)
        try? game.drop(type: .black, column: 0)
        try? game.drop(type: .black, column: 0)
    }
    
    func test_draw() {
        var game = Connect4()
        game.board = [
            [.empty, .black, .red, .red, .red, .black, .black],
            [.red, .red, .black, .black, .black, .red, .red],
            [.black, .black, .red, .red, .red, .black, .black],
            [.red, .red, .black, .black, .black, .red, .red],
            [.black, .black, .red, .red, .red, .black, .black],
            [.red, .red, .black, .black, .black, .red, .red],
        ]
        
        try? game.drop(type: .red, column: 0)
    }
}
