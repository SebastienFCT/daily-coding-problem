//
//  Problem_116Tests.swift
//  Problem 116Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-18.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_116

class Problem_116Tests: XCTestCase {

    func test_random_tree() {
        let root = Node(value: "root", random: false)
        print(root?.countNodes())
    }

}
