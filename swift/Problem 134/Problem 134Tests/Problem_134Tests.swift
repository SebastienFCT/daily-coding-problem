//
//  Problem_134Tests.swift
//  Problem 134Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-06.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_134

class Problem_134Tests: XCTestCase {

    func test_sparse_array() {
        let sparseArray = SparseArray(array: [0,1,0,2,0,3,0], size: 7)
        
        XCTAssert(sparseArray.get(i: 1) == 1)
        
        sparseArray.set(i: 10, val: 10)
        XCTAssert(sparseArray.get(i: 10) == 10)
        XCTAssert(sparseArray.get(i: 9) == 0)
    }

}
