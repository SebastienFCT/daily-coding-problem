//
//  Problem_286Tests.swift
//  Problem 286Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-03-06.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_286

class Problem_286Tests: XCTestCase {

    func test_example() {
        
        let input = City(buildings: [(0, 15, 3), (4, 11, 5), (19, 23, 4)])
        
        let actual = input.skyline()
        let expected = [(0, 3), (4, 5), (11, 3), (15, 0), (19, 4), (23, 0)]
        
        print(actual)
        
        for i in 0..<actual.count {
            XCTAssert(actual.map{ ($0.location, $0.height) }[i] == expected[i])
        }
        
    }

}
