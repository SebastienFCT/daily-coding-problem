//
//  Problem_92Tests.swift
//  Problem 92Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-08-25.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_92

class Problem_92Tests: XCTestCase {

    func test_example() {
        var dm = DependencyManager(nodes: [])
        dm.buildMap(input: [
                "CSC300": [
                    "CSC100"
                    , "CSC200"
                ]
                , "CSC200": ["CSC100"]
                , "CSC100": []
            ]
        )
        XCTAssert(dm.buildOptimalPath() == ["CSC100", "CSC200", "CSC300"])
    }

}
