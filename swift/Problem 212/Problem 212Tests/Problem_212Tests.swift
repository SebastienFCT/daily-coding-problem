//
//  Problem_212Tests.swift
//  Problem 212Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_212

class Problem_212Tests: XCTestCase {

    func test_example_1() {
        let spreadsheetManager = Spreadsheet()
        
        let actual = spreadsheetManager.columnName(value: 1)
        let expected = "A"
        
        XCTAssert(actual == expected)
    }
    
    func test_example_2() {
        let spreadsheetManager = Spreadsheet()
        
        let actual = spreadsheetManager.columnName(value: 27)
        let expected = "AA"
        
        XCTAssert(actual == expected)
    }

}
