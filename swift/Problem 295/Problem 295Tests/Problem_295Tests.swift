//
//  Problem_295Tests.swift
//  Problem 295Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_295

class Problem_295Tests: XCTestCase {

    func test_pascal_triangle() {
        
        for i in 1...10 {
            print(PascalTriangle().getRow(n: i))
        }
    }

}
