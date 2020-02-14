//
//  Problem_264Tests.swift
//  Problem 264Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-02-13.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_264

class Problem_264Tests: XCTestCase {

    func test_implementation() {
        
        var dbs = DeBrujinSequence(seen: Set(), edges: [])
        var characters = Set<Character>()
        characters.insert("0")
        characters.insert("1")
        
        let output = dbs.build(n: 3, characters: characters)
        
        print(dbs.edges)
        print(output)
    }

}
