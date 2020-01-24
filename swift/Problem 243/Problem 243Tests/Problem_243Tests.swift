//
//  Problem_243Tests.swift
//  Problem 243Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-23.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_243

class Problem_243Tests: XCTestCase {

    func test_example() {
        
        let input = [5, 1, 2, 7, 3, 4]
        
        print(input.minimumSumForKPartitions(k: 3) == 8)
    }

}
