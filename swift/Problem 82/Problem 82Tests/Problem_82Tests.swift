//
//  Problem_82Tests.swift
//  Problem 82Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-15.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_82

class Problem_82Tests: XCTestCase {

    func test_1() {
        var mc = MicrosoftChallenge(filename: "sample", ext: "md", count: 0, remaining: "")
        XCTAssert(mc.read7() == "This is")
        XCTAssert(mc.read7() == " a samp")
        XCTAssert(mc.read7() == "le file")
        mc.reset()
        XCTAssert(mc.read7() == "This is")
    }
    
    func test_2() {
        var mc = MicrosoftChallenge(filename: "sample", ext: "md", count: 0, remaining: "")
        XCTAssert(mc.readN(n: 10) == "This is a ")
        XCTAssert(mc.readN(n: 10) == "sample fil")
        XCTAssert(mc.readN(n: 10) == "le for tes")
    }

}
