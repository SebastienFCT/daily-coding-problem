//
//  Problem_11Tests.swift
//  Problem 11Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_11

class Problem_11Tests: XCTestCase {
    
    func testExample() {
        let input = ["dog", "deer", "deal"]
        
        XCTAssert(input.autocomplete("de") == ["deer", "deal"])
    }
    
}
