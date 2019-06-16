//
//  Problem_16Tests.swift
//  Problem 16Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_16

class Problem_16Tests: XCTestCase {

    func test() {
        var environment = Env()
        
        environment.record(id: "0")
        environment.record(id: "1")
        environment.record(id: "2")
        environment.record(id: "3")
        environment.record(id: "4")
        environment.record(id: "5")
        
        XCTAssert(environment.getLast(i: 2)!.id == "4")
    }
}
