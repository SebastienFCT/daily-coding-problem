//
//  Problem_314Tests.swift
//  Problem 314Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-04-03.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_314

class Problem_314Tests: XCTestCase {

    func test_example() {
        
        let input = Radio(listeners: [1, 5, 11, 20], towers: [4, 8, 15])
        
        print(input.minimumBoradcast())
    }

}
