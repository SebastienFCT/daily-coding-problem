//
//  Problem_32Tests.swift
//  Problem 32Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_32

class Problem_32Tests: XCTestCase {

    func test_1() {
        let currencyTable = [
            [0, "EUR", "CAD", 1.49],
            [1, "CAD", "EUR", 0.67],
            [2, "RMB", "EUR", 0.13],
            [3, "EUR", "RMB", 7.82],
            [4, "RMB", "CAD", 0.19],
            [5, "CAD", "RMB", 5.24]
        ]
        
        let currencyDebugger = CurrencyDebugger(currencyTable: currencyTable, originalCurrency: "EUR", originalValue: 100.0)
        
        XCTAssertTrue(currencyDebugger.anyDesignFlaw())
    }
    
    func test_2() {
        let currencyTable = [
            [0, "EUR", "CAD", 1.0],
            [1, "CAD", "EUR", 1.0],
            [2, "RMB", "EUR", 1.0],
            [3, "EUR", "RMB", 1.0],
            [4, "RMB", "CAD", 1.0],
            [5, "CAD", "RMB", 1.0]
        ]
        
        let currencyDebugger = CurrencyDebugger(currencyTable: currencyTable, originalCurrency: "EUR", originalValue: 100.0)
        
        XCTAssertFalse(currencyDebugger.anyDesignFlaw())
    }

}
