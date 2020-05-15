//
//  Solution.swift
//  Problem 356
//
//  Created by sebastien FOCK CHOW THO on 2020-05-15.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class Queue<T> {
    
    var arrays: [[T?]]
    var arraySize: Int
    var arrayCount: Int
    var currentIndex: Int
    
    init(arraySize: Int, arrayCount: Int) {
        arrays = []
        
        for _ in 1...arrayCount {
            arrays.append(Array(repeating: nil, count: arraySize))
        }
        
        self.arraySize = arraySize
        self.arrayCount = arrayCount
        self.currentIndex = 0
    }
    
    func enqueue(item: T) {
        
        if currentIndex == arrayCount * arraySize - 1 {
            fatalError("Queue is full")
        }
        
        if currentIndex == 0 {
            arrays[0][0] = item
            currentIndex += 1
            return
        }
        
        var previous: T = item
        
        for i in 0...currentIndex+1 {
            let arrayIndex = i / arraySize
            let itemIndex = i % arraySize
            
            if arrays[arrayIndex][itemIndex] != nil {
                let tmp = arrays[arrayIndex][itemIndex]!
                arrays[arrayIndex][itemIndex] = previous
                previous = tmp
            } else {
                arrays[arrayIndex][itemIndex] = previous
            }
        }
        
        currentIndex += 1
    }
    
    func dequeue() {
        
        if currentIndex == 0 {
            return
        }
        
        let arrayIndex = currentIndex / arraySize
        let itemIndex = currentIndex % arraySize
        
        arrays[arrayIndex][itemIndex] = nil
        currentIndex -= 1
    }
    
    func getSize() -> Int {
        
        return currentIndex
    }
    
    func printable() -> String {
        
        var result = ""
        
        for i in 0...currentIndex-1 {
            let arrayIndex = i / arraySize
            let itemIndex = i % arraySize
            
            result = result.isEmpty ? "\(arrays[arrayIndex][itemIndex]!)" : "\(result)->\(arrays[arrayIndex][itemIndex]!)"
        }
        
        return result
    }
}
