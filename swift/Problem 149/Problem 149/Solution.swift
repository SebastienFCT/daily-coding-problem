//
//  Solution.swift
//  Problem 149
//
//  Created by sebastien FOCK CHOW THO on 2019-10-21.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class CustomList {
    var list: [Int]
    var processedList: [Int]
    
    init(list: [Int]) {
        self.list = list
        self.processedList = []
        var sum = 0
        
        for element in list {
            sum += element
            self.processedList.append(sum)
        }
        
        print(list)
        print(processedList)
    }
    
    func sum(_ i: Int, _ j: Int) -> Int {
        guard i >= 0, j < self.list.count else {
            fatalError("index out of bounds")
        }
        
        return processedList[j-1] - ((i == 0) ? 0 : processedList[i-1])
    }
    
    // For UITests to valid the custom sum
    func sumByLoop(_ i: Int, _ j: Int) -> Int {
        var result = 0
        
        for index in i..<j {
            result += list[index]
        }
        
        return result
    }
}
