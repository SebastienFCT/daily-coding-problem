//
//  Problem_19Tests.swift
//  Problem 19Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_19

class Problem_19Tests: XCTestCase {

    func test() {
        let input = [
            [1, 2, 3],
            [1, 2, 3],
            [1, 2, 3]
        ]
        
        print(input.optimum())
    }

}
