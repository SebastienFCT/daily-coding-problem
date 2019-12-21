//
//  Problem_209Tests.swift
//  Problem 209Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-12-20.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_209

class Problem_209Tests: XCTestCase {

    func test_example() {
        XCTAssert(["epidemiologist", "refrigeration", "supercalifragilisticexpialodocious"].longestCommonSubsequence() == "eieio")
    }

}
