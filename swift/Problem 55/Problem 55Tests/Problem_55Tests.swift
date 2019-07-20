//
//  Problem_55Tests.swift
//  Problem 55Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-19.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_55

class Problem_55Tests: XCTestCase {

    func test_1() {
        var urlShortener = URLShortener(dictionary: [:], reverse: [:])
        
        let shortDailyCodingProblem = urlShortener.add(url: "https://www.dailycodingproblem.com/")
        let shortMicrosoft = urlShortener.add(url: "https://www.microsoft.com/en-ca/")
        let shortMe = urlShortener.add(url: "https://www.sebfct.com/")
        
        XCTAssert(shortDailyCodingProblem != shortMicrosoft)
        XCTAssert(shortMicrosoft != shortMe)
        XCTAssert(shortMe != shortDailyCodingProblem)
        
        XCTAssert(urlShortener.add(url: "https://www.dailycodingproblem.com/") == shortDailyCodingProblem)
        XCTAssert(urlShortener.add(url: "https://www.microsoft.com/en-ca/") == shortMicrosoft)
        XCTAssert(urlShortener.add(url: "https://www.sebfct.com/") == shortMe)
        
    }

}
