//
//  Problem_234Tests.swift
//  Problem 234Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_234

class Problem_234Tests: XCTestCase {

    func test_all_edges() {
        let n1 = Node(value: 0)
        let n2 = Node(value: 1)
        let n3 = Node(value: 2)
        let n4 = Node(value: 3)
        let n5 = Node(value: 4)
        
        n1.siblings = [(n2, 1), (n3, 2)]
        n3.siblings = [(n4, 4), (n5, 5)]
        
        let actual = n1.allEdges(current: [])
        
        XCTAssert(actual.contains(where: { (_, weight) -> Bool in
            return weight == 1
        }))
        
        XCTAssert(actual.contains(where: { (_, weight) -> Bool in
            return weight == 2
        }))
        
        XCTAssert(actual.contains(where: { (_, weight) -> Bool in
            return weight == 4
        }))
        
        XCTAssert(actual.contains(where: { (_, weight) -> Bool in
            return weight == 5
        }))
    }
    
    func test_maximum_spanning_tree() {
        let n1 = Node(value: 1)
        let n2 = Node(value: 2)
        let n3 = Node(value: 3)
        let n4 = Node(value: 4)
        let n5 = Node(value: 5)
        
        n1.siblings = [(n2, 1), (n3, 2)]
        n3.siblings = [(n4, 4), (n5, 5), (n2, 8)]
        
        let actual = n1.maximumSpanningTree()
        let expected = [8, 5, 4, 2] // It's ordered by descending weight
        
        XCTAssert(actual.map{ $0.weight } == expected)
    }

}
