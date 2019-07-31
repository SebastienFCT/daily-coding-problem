//
//  Problem_66Tests.swift
//  Problem 66Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-30.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_66

class Problem_66Tests: XCTestCase {

    func test_utilities() {
        print(Square().determineProbabilityTable(repetition: 500))
    }
    
    func test_tossing() {
        var biased = [true: 0, false: 0]
        var unbiased = [true: 0, false: 0]
        
        for _ in 0..<500 {
            biased[Square.toss_biased()]! += 1
            unbiased[Square.toss_unbiased()]! += 1
        }
        
        print("biased: \(biased)")
        print("unbiased: \(unbiased)")
    }

}
