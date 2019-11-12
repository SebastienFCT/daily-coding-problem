//
//  Problem_171Tests.swift
//  Problem 171Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-11-12.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_171

class Problem_171Tests: XCTestCase {

    func test_presence() {
        let presence = Presence(entries: [
            (1573599077, 1, .enter),
            (1573599078, 7, .enter),
            (1573599078, 1, .exit),
            (1573599079, 7, .enter),
            (1573599079, 2, .exit)
        ])
        
        XCTAssert(presence.busiestPeriod() == (1573599078.0, 1573599079.0))
    }

}
