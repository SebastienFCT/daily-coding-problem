//
//  Solution.swift
//  Problem 213
//
//  Created by sebastien FOCK CHOW THO on 2019-12-24.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension String {
    
    func ipCandidates() -> [String] {
        
        var result: [String] = []
        
        let candidates = next(current: [], part: 1)
        
        for candidate in candidates {
            var output = ""
            
            for i in 0..<candidate.count {
                
                if i > 0 { output = "\(output)." }
                output = "\(output)\(candidate[i].first ?? "")"
            }
            
            result.append(output)
        }
        
        return result
    }
    
    private func next(current: [[[String]]], part: Int) -> [[[String]]] {
        
        var result: [[[String]]] = []
        
        if part == 4 {
            if self.count > 4 { return [] }
            
            for candidate in current {
                var copy = candidate
                
                if self.isValidIpPartRange() {
                    copy.append([self])
                    
                    result.append(copy)
                }
            }
        } else {
            
            let limit = min(3, count)
            
            for i in 1...limit {
                
                var batch: [[[String]]] = []
                
                if part == 1 {
                    let newInput: [String] = ["\(self.prefix(i))"]
                    
                    batch.append([newInput])
                } else {
                    for candidate in current {
                        
                        var copy = candidate
                        let value = "\(self.prefix(i))"
                        
                        if value.isValidIpPartRange() {
                            copy.append([value])
                            batch.append(copy)
                        }
                    }
                }
                
                let rest = "\(self.suffix(count-i))"
                
                result.append(contentsOf: rest.next(current: batch, part: part+1))
            }
            
        }
        
        return result
    }
    
    private func isValidIpPartRange() -> Bool {
        
        if self.first! == "0" && self.count > 1 { return false }
        
        if count > 3 { return false }
        
        let limit = min(3, count)
        var intVal = 0
        
        for i in 0...limit-1 {
            let copy = self.prefix(count-i)
            
            let power = pow(10.0, Double(i))
            let current = Int(String(copy.last!)) ?? 0
            
            intVal += current * Int(power)
        }
        
        if intVal > 255 { return false }
        
        return true
    }
}
