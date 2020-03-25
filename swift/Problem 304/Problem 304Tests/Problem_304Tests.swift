//
//  Problem_304Tests.swift
//  Problem 304Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-24.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_304

class Problem_304Tests: XCTestCase {

    func test_chess_knight_experiment() {
        
        let ce = ChessExperiments()
        
        print(ce.knightProbabityToRemainOnBoard(boardDimension: 8, position: (2, 2), afterTotalMove: 1, sampleSize: 10000))
    }

}
