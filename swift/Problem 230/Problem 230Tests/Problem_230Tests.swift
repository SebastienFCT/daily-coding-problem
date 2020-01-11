//
//  Problem_230Tests.swift
//  Problem 230Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-10.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_230

class Problem_230Tests: XCTestCase {

    func test() {
        
        let gsp = GoldmanSachsProblems()
        
        XCTAssert(gsp.minimumDropsForOptimalFloorInWorstCase(numberOfEggs: 1, numberOfFloors: 50) == 50)
        XCTAssert(gsp.minimumDropsForOptimalFloorInWorstCase(numberOfEggs: 2, numberOfFloors: 50) == 25)
    }

}
