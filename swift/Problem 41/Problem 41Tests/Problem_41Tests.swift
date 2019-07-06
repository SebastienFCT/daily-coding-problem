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
        
        for itinerary in itineraries {
            
            print(itinerary.buildFullPath())
        }
    }

}
