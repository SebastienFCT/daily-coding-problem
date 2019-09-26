//
//  Problem_124Tests.swift
//  Problem 124Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_124

class Problem_124Tests: XCTestCase {

    func test_approximation_of_iteration_before_reaching_one_remaining_coin() {
        print("Starting with 10 coins, you should expect to play \(approximateIterations(n: 10, targetRemaining: 1, sampleSize: 200)) round(s) in average until one coin remains")
        print("Starting with 10 coins, you should expect to play \(approximateIterations(n: 10, targetRemaining: 1, sampleSize: 400)) round(s) in average until one coin remains")
        print("Starting with 10 coins, you should expect to play \(approximateIterations(n: 10, targetRemaining: 1, sampleSize: 1000)) round(s) in average until one coin remains")
    }

}
