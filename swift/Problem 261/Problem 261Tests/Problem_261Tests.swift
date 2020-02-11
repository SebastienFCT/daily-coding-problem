//
//  Problem_261Tests.swift
//  Problem 261Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_261

class Problem_261Tests: XCTestCase {

    func test_example() {
        
        // taken from https://en.wikipedia.org/wiki/Letter_frequency
        
        let charFrequency: [Character : Int] = [
            "c": 2,
            "a": 8,
            "t": 9,
            "s": 6,
            "o": 7
        ]
        
        let input = HuffmanTree(characterFrequency: charFrequency)
        print(input.buildTree()?.toHuffmanEncoding(current: ""))
    }

}
