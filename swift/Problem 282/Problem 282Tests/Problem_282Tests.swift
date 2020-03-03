//
//  Problem_282Tests.swift
//  Problem 282Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-02.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_282

class Problem_282Tests: XCTestCase {

    func test_pythogoran_triplet() {
        
        XCTAssert([24, 7, 25, 10, 2, 12].pythogoranTriplet() == [24, 7, 25])
        XCTAssert([25, 10, 7, 2, 24, 12].pythogoranTriplet() == [7, 24, 25])
        
        XCTAssertNil([1].pythogoranTriplet())
        XCTAssertNil([2, 4, 6, 8].pythogoranTriplet())
    }

}
