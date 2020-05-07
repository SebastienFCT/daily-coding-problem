//
//  Problem_348Tests.swift
//  Problem 348Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_348

class Problem_348Tests: XCTestCase {

    func test_example() {
        
        var tt = TernaryTree()
        
        XCTAssertNil(tt.root)
        
        tt.insert(word: "code")
        
        if let codeSearch = tt.search(word: "code") {
            XCTAssert(codeSearch.map{ $0.value } == ["c", "o", "d", "e"])
        }
        
        XCTAssertNil(tt.search(word: "cob"))
        
        tt.insert(word: "cob")
        tt.insert(word: "be")
        tt.insert(word: "ax")
        tt.insert(word: "war")
        tt.insert(word: "we")
        
        if let warSearch = tt.search(word: "war") {
            XCTAssert(warSearch.map{ $0.value } == ["c", "w", "a", "r"])
        } else {
            XCTFail("Couldn't find 'war'")
        }
        
        if let axSearch = tt.search(word: "ax") {
            XCTAssert(axSearch.map{ $0.value } == ["c", "b", "a", "x"])
        } else {
            XCTFail("Couldn't find 'ax'")
        }
    }

}
