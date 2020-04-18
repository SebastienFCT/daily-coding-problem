//
//  Problem_329Tests.swift
//  Problem 329Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-18.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_329

class Problem_329Tests: XCTestCase {

    func test_example() {
        
        let population = Population(guyPrefs: [
            "andrew": ["caroline", "abigail", "betty"],
            "bill": ["caroline", "betty", "abigail"],
            "chester": ["betty", "caroline", "abigail"]
        ], galPrefs: [
            "abigail": ["andrew", "bill", "chester"],
            "betty": ["bill", "andrew", "chester"],
            "caroline": ["bill", "chester", "andrew"]
        ])
        
        print(population.marry())
    }

}
