//
//  Problem_345Tests.swift
//  Problem 345Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-04.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_345

class Problem_345Tests: XCTestCase {

    func test_example() {
        
        let synonyms: [Synonym] = [
            ("eat", "consume"),
            ("consume", "absorb")
        ]
        
        XCTAssertTrue(areTheSame(left: "He wants to eat food.", right: "He wants to consume food.", synonyms: synonyms, connectSynonyms: false))
        
        XCTAssertFalse(areTheSame(left: "He wants to eat food.", right: "He wants to absorb food.", synonyms: synonyms, connectSynonyms: false))
        XCTAssertFalse(areTheSame(left: "He wants to eat food.", right: "He wants to absorb food.", synonyms: synonyms, connectSynonyms: true))
    }

}
