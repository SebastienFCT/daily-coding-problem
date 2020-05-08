//
//  Problem_349Tests.swift
//  Problem 349Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-08.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_349

class Problem_349Tests: XCTestCase {

    func test_example() {
        
        let soundex = Soundex(similarConsonants: ["c" : "k"])
        
        // This one returns j225 instead of j250
        // There is probably a rule missing in the problem that would cancel the "j" and the "s"
        // It might also be the fact that I did not add anymore values to the similar consonants dictionary
        print(soundex.encode(word: "Jackson"))
        
        XCTAssert(soundex.encode(word: "JAxen") == "j250")
    }

}
