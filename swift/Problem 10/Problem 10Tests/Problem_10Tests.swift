//
//  Problem_10Tests.swift
//  Problem 10Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-06-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_10

class Problem_10Tests: XCTestCase {

    func testExample() {        
        JobScheduler(fun: Functions().printExecuted, delay: 2000)
//        BackgroundJobScheduler(fun: Functions().printExecuted, delay: 2000)
    }

}
