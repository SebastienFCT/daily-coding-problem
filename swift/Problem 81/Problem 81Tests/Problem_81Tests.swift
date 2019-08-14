//
//  Problem_81Tests.swift
//  Problem 81Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_81

class Problem_81Tests: XCTestCase {

    func test_example() {
        let map: YelpMapping = [
            "2":["a", "b", "c"],
            "3":["d", "e", "f"],
            "4":["h", "i", "j"],
            "5":["k", "l", "m"],
            "6":["n", "o", "p"],
            "7":["q", "r", "s"],
            "8":["t", "u", "v"],
            "9":["w", "x", "y"],
            "0":["z"]
        ]
        
        let decoder = YelpDecoder(map: map)
        XCTAssert(decoder.decode(message: "23") == ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])
    }

}
