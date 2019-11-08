//
//  Problem_167Tests.swift
//  Problem 167Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-08.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_167

class Problem_167Tests: XCTestCase {

    func test_example() {
        let result = ["code", "edoc", "da", "d"].pairsThatBuildPalindrome()
        
        XCTAssert(result.count == 3)
        XCTAssert(result.contains(where: { (element) -> Bool in
            element.leftIndex == 0 && element.rightIndex == 1
            ||
            element.leftIndex == 1 && element.rightIndex == 0
            ||
            element.leftIndex == 2 && element.rightIndex == 3
        }))
    }

}
