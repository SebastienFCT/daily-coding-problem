//
//  Problem_318Tests.swift
//  Problem 318Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_318

class Problem_318Tests: XCTestCase {

    func test_count_valid_playlists() {
        
        
        let input = Trip()
        
        // required: 3
        // available: S1 S2
        // buffer: 1
        // candidates: [S1, S2, S1], [S2, S1, S2]
        
        let actual = input.countValidPlaylists(requiredSongs: 3, actualSongs: 2, buffer: 1)
        let expected = 2
        
        XCTAssert(actual == expected)
        
        // required: 4
        // available: S1 S2
        // buffer: 1
        // candidates: [S1, S2, S1, S2], [S2, S1, S2, S1]
        
        let actual2 = input.countValidPlaylists(requiredSongs: 4, actualSongs: 2, buffer: 1)
        let expected2 = 2
        
        XCTAssert(actual2 == expected2)
    }

}
