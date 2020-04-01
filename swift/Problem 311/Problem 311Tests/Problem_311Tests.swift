//
//  Problem_311Tests.swift
//  Problem 311Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-31.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_311

class Problem_311Tests: XCTestCase {

    func test_find_a_peak() {
        
        let input = [2, 3, 4, 5, 3, 2, 7, 6, 1]
        
        print(input.anyPeak())
        
        let input2 = [2, 3, 12, 15, 3, 1]
        
        print(input2.anyPeak())
    }

}
