//
//  Problem_120Tests.swift
//  Problem 120Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_120

class Problem_120Tests: XCTestCase {

    func test_twist_singleton() {
        _ = Singleton.getInstance()
        _ = Singleton.getInstance()
        _ = Singleton.getInstance()
        _ = Singleton.getInstance()
        _ = Singleton.getInstance()
    }

}
