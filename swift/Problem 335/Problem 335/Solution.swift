//
//  Solution.swift
//  Problem 335
//
//  Created by sebastien FOCK CHOW THO on 2020-04-25.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Node {
    var value: String
    var pointers: [Node]
    
    init(value: String, pointers: [Node]) {
        self.value = value
        self.pointers = pointers
    }
    
    init(value: String) {
        self.value = value
        self.pointers = []
    }
}

struct PageInfo {
    var value: String
    var referenceCount: Int
    var referencingCount: Int
}

struct Web {
    
    var pages: [Node]
    var dampingFactor: Float
    
    private func pageInfos() -> [PageInfo] {
        
        var result: [String : PageInfo] = [:]
        
        for page in pages {
            
            if !result.keys.contains(page.value) {
                result[page.value] = PageInfo(value: page.value, referenceCount: 0, referencingCount: page.pointers.count)
            } else {
                result[page.value]!.referencingCount = page.pointers.count
            }
            
            for link in page.pointers {
                if !result.keys.contains(link.value) {
                    result[link.value] = PageInfo(value: link.value, referenceCount: 1, referencingCount: 0)
                } else {
                    result[link.value]!.referenceCount += 1
                }
            }
        }
        
        return result.map({ $0.value })
    }
    
    func ranking() -> [String: Float] {
        
        var result: [String: Float] = [:]
        let infos = pageInfos()
        
        for info in infos {
            let referenceFactor = (1.0 - dampingFactor) / Float(info.referencingCount)
            let othersFactor = dampingFactor * Float(info.referenceCount)
            
            result[info.value] = referenceFactor + othersFactor
        }
        
        return result
    }
}
