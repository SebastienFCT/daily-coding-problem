//
//  Solution.swift
//  Problem 173
//
//  Created by sebastien FOCK CHOW THO on 2019-11-14.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    
    func flatten() -> [String: Any] {
        var result: [String: Any] = [:]
        
        for key in self.keys {
            if let value = self[key] as? [String: Any] {
                let flattened = value.flatten()
                
                for subKey in flattened.keys {
                    let combine = "\(key).\(subKey)"
                    result[combine] = flattened[subKey]
                }
            } else {
                result[key] = self[key]
            }
        }
        
        return result
    }
}
