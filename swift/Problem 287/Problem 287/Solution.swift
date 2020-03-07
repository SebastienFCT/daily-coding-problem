//
//  Solution.swift
//  Problem 287
//
//  Created by sebastien FOCK CHOW THO on 2020-03-07.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias Website = Character
typealias Visit = (website: Website, user: Int)
typealias WebsitePairWithSimilarities = (left: Website, right: Website, count: Int)

struct Web {
    
    var visits: [Visit]
    
    func topSimilarities(forPairCount k: Int) -> [WebsitePairWithSimilarities] {
        
        var result: [WebsitePairWithSimilarities] = []
        
        let allVisits = allVisitsPerWebsite()
        let allKeys = allVisits.map{ $0.key }
        
        for i in 0..<allKeys.count-1 {
            for j in i+1..<allKeys.count {
                if let left = allVisits[allKeys[i]], let right = allVisits[allKeys[j]] {
                    
                    let similarityCount = left.intersection(right).count
                    let differenceCount = left.symmetricDifference(right).count
                    
                    let count = similarityCount-differenceCount
                    
                    result.append((allKeys[i], allKeys[j], count))
                }
            }
        }
        
        let sorted = result.sorted{ $0.count > $1.count }
        
        guard sorted.count > k else {
            return sorted
        }
        
        return Array(sorted.prefix(k))
    }
    
    func allVisitsPerWebsite() -> [Website : Set<Int>] {
        
        var result: [Website : Set<Int>] = [:]
        
        for visit in visits {
            
            if !result.keys.contains(visit.website) {
                result[visit.website] = Set()
            }
            
            result[visit.website]!.insert(visit.user)
        }
        
        return result
    }
    
    
}
