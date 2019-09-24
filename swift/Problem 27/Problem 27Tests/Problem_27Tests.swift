//
//  Problem_27Tests.swift
//  Problem 27Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_27

class Problem_27Tests: XCTestCase {
    
    func test_example() {
        let pairs = Pairs(sets: [Pair(left: "{", right: "}"), Pair(left: "[", right: "]"), Pair(left: "(", right: ")")])
        
        var input = "([])[]({})"
        XCTAssertTrue(input.isWellFormed3(forPairs: pairs))
    }

}
