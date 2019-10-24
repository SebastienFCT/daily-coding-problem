//
//  Problem_151Tests.swift
//  Problem 151Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-10-23.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_151

class Problem_151Tests: XCTestCase {

    func test_example() {
        var input = [
            ["B", "B", "W"],
            ["W", "W", "W"],
            ["W", "W", "W"],
            ["B", "B", "B"]
        ]
        
        _ = input.replace(location: (2, 2), withValue: "G")
        
        XCTAssert(input == [
            ["B", "B", "G"],
            ["G", "G", "G"],
            ["G", "G", "G"],
            ["B", "B", "B"]
        ])
    }

}
