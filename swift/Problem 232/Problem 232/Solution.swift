//
//  Solution.swift
//  Problem 232
//
//  Created by sebastien FOCK CHOW THO on 2020-01-12.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

struct PrefixMap {
    var map: [String: Int]
    
    mutating func insert(key: String, value: Int) {
        map[key] = value
    }
    
    func sum(prefix: String) -> Int {
        var result = 0
        
        let keys = map.keys
        let filteredKeys = keys.filter{ $0[0...prefix.count-1] == prefix }
        
        for key in filteredKeys {
            result += map[key]!
        }
        
        return result
    }
}

// Utilities

public extension String {
  subscript(value: Int) -> Character {
    self[index(at: value)]
  }
}

public extension String {
  subscript(value: NSRange) -> Substring {
    self[value.lowerBound..<value.upperBound]
  }
}

public extension String {
  subscript(value: CountableClosedRange<Int>) -> Substring {
    self[index(at: value.lowerBound)...index(at: value.upperBound)]
  }

  subscript(value: CountableRange<Int>) -> Substring {
    self[index(at: value.lowerBound)..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeUpTo<Int>) -> Substring {
    self[..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeThrough<Int>) -> Substring {
    self[...index(at: value.upperBound)]
  }

  subscript(value: PartialRangeFrom<Int>) -> Substring {
    self[index(at: value.lowerBound)...]
  }
}

private extension String {
  func index(at offset: Int) -> String.Index {
    index(startIndex, offsetBy: offset)
  }
}
