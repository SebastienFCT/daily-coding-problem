//
//  Problem_64Tests.swift
//  Problem 64Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-28.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_64

class Problem_64Tests: XCTestCase {

    func test_example() {
        let board = [
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,1,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0]
        ]
        
        let knight = Knight(position: (2,2), board: board)
        print(knight.countTours())
    }

}
