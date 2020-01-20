//
//  Problem_236Tests.swift
//  Problem 236Tests
//
//  Created by sebastien FOCK CHOW THO on 2020-01-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import XCTest
@testable import Problem_236

class Problem_236Tests: XCTestCase {

    func test_point_in_polygon() {
        
        let polygon: NPolygon = [(1, 1), (1, 2), (3, 6), (4, 2), (5, 3)]
        let point: NPoint = (2, 2)
        
        XCTAssertTrue(isPointInPolygon(point: point, polygon: polygon))
    }
    
    func test_point_out_of_polygon() {
        
        let polygon: NPolygon = [(1, 1), (1, 2), (3, 6), (4, 2), (5, 3)]
        let point: NPoint = (6, 6)
        
        XCTAssertFalse(isPointInPolygon(point: point, polygon: polygon))
    }
    
    func test_point_on_polygon_bound() {
        
        let polygon: NPolygon = [(1, 1), (1, 2), (3, 6), (4, 2), (5, 3)]
        let point: NPoint = (1, 1)
        
        XCTAssertFalse(isPointInPolygon(point: point, polygon: polygon))
    }

}
