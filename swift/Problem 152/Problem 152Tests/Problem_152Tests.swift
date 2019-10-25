//
//  Problem_152Tests.swift
//  Problem 152Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_152

class Problem_152Tests: XCTestCase {

    func test_example() {
        let tb = Triplebyte(values: [1, 2, 3, 4], percentages: [0.1, 0.5, 0.2, 0.2])
        
        var repartition: [Int: Double] = [
            1: 0,
            2: 0,
            3: 0,
            4: 0
        ]
        
        let iterationCount = 1000
        
        for _ in 0...iterationCount {
            let value = tb.random()
            repartition[value]! += 1
        }
        
        for key in repartition.keys {
            repartition[key] = repartition[key]! / Double(iterationCount)
        }
        
        print(repartition)
    }

}
