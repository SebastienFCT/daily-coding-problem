//
//  Solution.swift
//  Problem 236
//
//  Created by sebastien FOCK CHOW THO on 2020-01-16.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias NPoint = (x: Int, y: Int)

typealias NPolygon = [NPoint]    // Assuming it's ordered

func isPointInPolygon(point: NPoint, polygon: NPolygon) -> Bool {
    
    // Based on https://en.wikipedia.org/wiki/Point_in_polygon:
    
    // Create a line equation out of the point: Zx + y for example
    // To make it simpler, let's use the horizontal line passing by y2 -> y = y2
    
    // For each segment, check if line goes through, if we touch a boudary, we stop and return false
    
    var intersections = 0
    
    var index = 0
    while index < polygon.count-1 {
        let p1 = polygon[index]
        let p2 = polygon[index+1]
        
        // If touches boundary, return false
        if crossProduct(p1: p1, p2: p2, comparisonPoint: point) == 0 {
            return false
        }
        
        let betweenYs = (p1.y >= point.y && p2.y <= point.y || p1.y <= point.y && p2.y >= point.y)
        let passedX = p1.x >= point.x || p2.x >= point.x
        
        if betweenYs && passedX {
            intersections += 1
        }
        
        index += 2
    }
    
    if polygon.count % 2 == 0 {
        let p1 = polygon[polygon.count-1]
        let p2 = polygon[0]
        
        if crossProduct(p1: p1, p2: p2, comparisonPoint: point) == 0 {
            return false
        }
        
        if p1.y >= point.y && p2.y <= point.y || p1.y <= point.y && p2.y >= point.y {
            intersections += 1
        }
    }
    
    return intersections % 2 == 1
}

func crossProduct(p1: NPoint, p2: NPoint, comparisonPoint: NPoint) -> Int {
    
    return (p2.y - p1.y) * (comparisonPoint.x - p1.x) - (p2.x - p1.x) * (comparisonPoint.y - p1.y)
}
