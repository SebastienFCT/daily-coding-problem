//
//  Solution.swift
//  Problem 65
//
//  Created by sebastien FOCK CHOW THO on 2019-07-29.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Array<Int> {
    enum MatrixEdge {
        case top
        case right
        case bottom
        case left
        
        func next() -> MatrixEdge {
            switch self {
            case .top:
                return .right
            case .right:
                return .bottom
            case .bottom:
                return .left
            case .left:
                return .top
            }
        }
    }
    
    mutating func clockWiseList() -> [Int] {
        var result: [Int] = []
        var edge: MatrixEdge = .top
        
        while !self.isEmpty {
            switch edge {
            case .top:
                result.append(contentsOf: self.removeFirst())
            case .right:
                for i in 0..<self.count {
                    result.append(self[i].removeLast())
                }
            case .bottom:
                result.append(contentsOf: self.removeLast().reversed())
            case .left:
                for i in 0..<self.count {
                    result.append(self[self.count-1-i].removeFirst())
                }
            }
            
            edge = edge.next()
        }
        
        return result
    }
}
