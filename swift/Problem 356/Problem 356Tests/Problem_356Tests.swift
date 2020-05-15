//
//  Problem_356Tests.swift
//  Problem 356Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-05-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_356

class Problem_356Tests: XCTestCase {

    func test_queue() {
        
        let queue = Queue<Int>(arraySize: 3, arrayCount: 5)
        
        XCTAssert(queue.getSize() == 0)
        
        queue.dequeue()
        
        XCTAssert(queue.getSize() == 0)
        
        queue.enqueue(item: 1)
        queue.enqueue(item: 2)
        queue.enqueue(item: 3)
        queue.enqueue(item: 4)
        queue.enqueue(item: 5)
        
        XCTAssert(queue.printable() == "5->4->3->2->1")
        XCTAssert(queue.getSize() == 5)
        
        queue.dequeue()
        
        XCTAssert(queue.printable() == "5->4->3->2")
        XCTAssert(queue.getSize() == 4)
        
    }

}
