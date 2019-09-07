//
//  Problem_105Tests.swift
//  Problem 105Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-09-07.
//  Copyright © 2019 sebfct. All rights reserved.
//

import XCTest
@testable import Problem_105

class Problem_105Tests: XCTestCase {
    
    func test_debounce() {
        let debouncer = Debouncer(workItem: nil)
        
        for _ in 0...2 {
            print("I ran out of debouncer at \(Date())")
            debouncer.debounce(delay: .seconds(1), queue: .global(qos: .background))
            Thread.sleep(forTimeInterval: 1)
        }
    }

}
