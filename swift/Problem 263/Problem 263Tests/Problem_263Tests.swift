//
//  Problem_263Tests.swift
//  Problem 263Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_263

class Problem_263Tests: XCTestCase {

    func test_sentences() {
        
        XCTAssertFalse("The quick brown fox jumps over the lazy dog".areValidSentences())
        XCTAssertTrue("The quick brown fox jumps over the lazy dog!".areValidSentences())
        XCTAssertTrue("The quick brown fox.Jumps over,the lazy dog!".areValidSentences())
        XCTAssertFalse("The quick brown fox. Jumps over,the lazy dog!".areValidSentences())
    }

}
