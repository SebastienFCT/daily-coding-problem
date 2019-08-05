//
//  Problem_71Tests.swift
//  Problem 71Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_71

class Problem_71Tests: XCTestCase {

    func test_rand5() {
        var distribution: [Int : Int] = [
            1:0,
            2:0,
            3:0,
            4:0,
            5:0
        ]
        
        for _ in 0...100000 {
            let rand5 = TwoSigma.rand5()
            
            distribution[rand5]! += 1
        }
        
        print(distribution.mapValues{ value in
            return Double(value) / 10000.0
        })
    }

}
