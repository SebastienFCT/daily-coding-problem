//
//  Problem_325Tests.swift
//  Problem 325Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_325

class Problem_325Tests: XCTestCase {

    func test_converter() {
        
        var system = CustomSystem(units: [FCTUnit(label: "inches", multiplier: 1)])
        
        system.inserUnitWithLabel("foot", reference: "inches", withMutiplier: 12)
        system.inserUnitWithLabel("yard", reference: "foot", withMutiplier: 3)
        system.inserUnitWithLabel("chain", reference: "yard", withMutiplier: 22)
        
        let actual = system.convert(fromUnit: "chain", toUnit: "foot", value: 1)
        let expected: Float = 66
        
        XCTAssert(actual == expected)
    }

}
