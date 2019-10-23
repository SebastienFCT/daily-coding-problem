//
//  Solution.swift
//  Problem 150
//
//  Created by sebastien FOCK CHOW THO on 2019-10-22.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias XYPoint = (x: Int, y: Int)

extension Array where Element == XYPoint {
    
    typealias XYPointDistance = (point: XYPoint, distance: Int)
    
    func findNearestPoints(from: XYPoint, limit: Int) -> [XYPoint] {
        
        if limit >= self.count {
            return self
        }
        
        let distances: [XYPointDistance] = self.map{ point in
            let xDistance = abs(from.x - point.x)
            let yDistance = abs(from.y - point.y)
            
            return (point, xDistance + yDistance)
        }
        
        let sorted = distances.sorted{ $0.distance < $1.distance }.prefix(limit).map{ $0.point }
        
        return sorted
    }
}
