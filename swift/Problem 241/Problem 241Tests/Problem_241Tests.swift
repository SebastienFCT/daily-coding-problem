//
//  Problem_241Tests.swift
//  Problem 241Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-21.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_241

class Problem_241Tests: XCTestCase {

    func test_example() {
        let academia = Academia()
        
        XCTAssert(academia.hIndex(papers: 5, citations: [4,3,0,1,5]) == 3)
    }

}
