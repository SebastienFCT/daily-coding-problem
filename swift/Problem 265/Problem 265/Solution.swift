//
//  Solution.swift
//  Problem 265
//
//  Created by sebastien FOCK CHOW THO on 2020-02-14.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func distributeBonuses() -> [Int] {
        
        var result: [Int] = []
        
        let groups = buildGroups()
        
        for group in groups {
            
            if group.1 == .descending {
                for i in stride(from: group.0, through: 1, by: -1) {
                    result.append(result.last ?? 0 <= i ? i - 1 : i)
                }
            } else {
                for i in 1...group.0 {
                    result.append(result.last ?? 0 >= i ? i + 1 : i)
                }
            }
        }
        
        return result
    }
    
    enum OrderType {
        case ascending
        case descending
    }
    
    typealias Group = (Int, OrderType)
    
    func buildGroups() -> [Group] {
        
        guard count > 0 else {
            return []
        }
        
        guard count > 1 else {
            return [(first!, .descending)]
        }
        
        var ordering: OrderType? = nil
        var current = first!
        var total = 1
        
        ordering = self[1] > current ? .ascending : .descending
        current = self[1]
        total += 1
        
        guard count > 2 else {
            return [(total, ordering!)]
        }
        
        var result: [Group] = []
        
        for i in 2..<count {
            if ((ordering == .ascending && self[i] > current) || (ordering == .descending && self[i] < current)) {
                current = self[i]
                total += 1
            } else {
                result.append((total, ordering!))
                let rest = Array(suffix(count-i))
                result.append(contentsOf: rest.buildGroups())
                break
            }
        }
        
        return result
    }
}
