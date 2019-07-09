//
//  Problem_41Tests.swift
//  Problem 41Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-05.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_41

class Problem_41Tests: XCTestCase {

    func test_1() {
        let input: [(depart: String, arrival: String)] =  [("SFO", "HKO"), ("YYZ", "SFO"), ("YUL", "YYZ"), ("HKO", "ORD")]
        let itineraries = input.buildItineraries(start: "YUL")
        
        var result: [[String]] = []
        
        for itinerary in itineraries {
            result += itinerary.buildFullPath()
        }
        
        XCTAssert(result.lexicographicallySmallestPath()! == ["YUL", "YYZ", "SFO", "HKO", "ORD"])
    }
    
    func test_2() {
        let input: [(depart: String, arrival: String)] = [("SFO", "COM"), ("COM", "YYZ")]
        let itineraries = input.buildItineraries(start: "COM")
        
        var result: [[String]] = []
        
        for itinerary in itineraries {
            result += itinerary.buildFullPath()
        }
        
        XCTAssert(result.lexicographicallySmallestPath() == nil)
    }
    
    func test_3() {
        let input: [(depart: String, arrival: String)] = [("A", "B"), ("A", "C"), ("B", "C"), ("C", "A")]
        let itineraries = input.buildItineraries(start: "A")
        
        var result: [[String]] = []
        
        for itinerary in itineraries {
            result += itinerary.buildFullPath()
        }
        
        XCTAssert(result.lexicographicallySmallestPath()! == ["A", "B", "C", "A", "C"])
    }

}
