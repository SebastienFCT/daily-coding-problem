//
//  Problem_53Tests.swift
//  Problem 53Tests
//
//  Created by sebastien FOCK CHOW THO on 2019-07-17.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_53

class Problem_53Tests: XCTestCase {

    func test_example() {
        var fifo = FIFO(stack1: [], stack2: [])
        
        fifo.enqueue(item: "Hello World")
        fifo.enqueue(item: 1)
        print(fifo.stack1)
        fifo.dequeue()
        print(fifo.stack1)
        fifo.enqueue(item: ["foo" : "bar"])
        print(fifo.stack1)
    }

}
