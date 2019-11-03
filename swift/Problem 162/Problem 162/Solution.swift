//
//  Solution.swift
//  Problem 162
//
//  Created by sebastien FOCK CHOW THO on 2019-11-03.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class SquareChallenge {
    var input: [String]
    
    var map: (input: [String], output: [String])
    var outputKeys: [String]
    var outputValues: [String]
    
    init(input: [String]) {
        self.input = input
        
        self.map = (input, input.map{ String($0.prefix(1)) })
        self.outputKeys = []
        self.outputValues = []
        
        process()
    }
    
    private func process() {
        
        while !map.output.isEmpty {
            
            var index = 0
            
            while index < map.output.count {
                var copyKeys = map.input
                var copyValues = map.output
                
                let currentKey = copyKeys.remove(at: index)
                let currentValue = copyValues.remove(at: index)

                if !copyValues.contains(currentValue) {
                    map.input.remove(at: index)
                    map.output.remove(at: index)
                    
                    outputKeys.append(currentKey)
                    outputValues.append(currentValue)
                } else {
                    index += 1
                }
            }
            
            if map.output.count > 0 {
                let newLength = map.output[0].count + 1
                
                let newOutput = map.input.map{ String($0.prefix(newLength)) }
                let newMap = (map.input, newOutput)
                
                self.map = newMap
            }
        }
    }
    
    func log() -> String {
        var result = ""
        
        for i in 0..<outputKeys.count {
            result += "\(outputKeys[i]) => \(outputValues[i])\n"
        }
        
        return result
    }
    
}
