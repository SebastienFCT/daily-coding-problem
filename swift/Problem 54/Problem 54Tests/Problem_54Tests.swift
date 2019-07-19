//
//  Problem_54Tests.swift
//  Problem 54Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_54

class Problem_54Tests: XCTestCase {

    func test_1() {
        // available at http://www.sudokuessentials.com/how_to_play_sudoku.html
        let simplesudoku = [
            [4,1,nil,2,7,nil,8,nil,5],
            [nil,8,5,1,4,6,nil,9,7],
            [nil,7,nil,5,8,nil,nil,4,nil],
            [9,2,7,4,5,1,3,8,6],
            [5,3,8,6,9,7,4,1,2],
            [1,6,4,3,2,8,7,5,9],
            [8,5,2,7,nil,4,9,nil,nil],
            [nil,9,nil,8,nil,2,5,7,4],
            [7,4,nil,9,6,5,nil,2,8]
        ]
        
        var sudoku = Sudoku(board: simplesudoku, possibilitiesBoard: [])
        sudoku.proceed()
    }

}
