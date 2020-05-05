//
//  Problem_346Tests.swift
//  Problem 346Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-05.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_346

class Problem_346Tests: XCTestCase {

    func test_example() {
        
        let input = AirbnbFlights(flights: [
            Flight(from: "JFK", to: "ATL", 150),
            Flight(from: "ATL", to: "SFO", 400),
            Flight(from: "ORD", to: "LAX", 200),
            Flight(from: "LAX", to: "DFW", 80),
            Flight(from: "JFK", to: "HKG", 800),
            Flight(from: "ATL", to: "ORD", 90),
            Flight(from: "JFK", to: "LAX", 500),
        ])
        
        let actual = input.cheapestTrip(from: "JFK", to: "LAX", withMaxConnection: 3)
        let expected = 440
        
        XCTAssert(actual == expected)
    }

}
