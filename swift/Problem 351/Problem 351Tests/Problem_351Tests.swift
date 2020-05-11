//
//  Problem_351Tests.swift
//  Problem 351Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_351

class Problem_351Tests: XCTestCase {

    func test_quora_meaning() {
        
        let input = QuoraChallenge(meanings: [
            "bank" : [
                "a place where people deposit money",
                "a land beside a river or lake"
            ]
        ])
        
        let actual = input.meaning(of: "bank", in: "I went to get money from the bank")
        let expected = ["a place where people deposit money"]
        
        XCTAssert(actual == expected)
    }

}
