//
//  Solution.swift
//  Problem 130
//
//  Created by sebastien FOCK CHOW THO on 2019-10-02.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    func maxProfits(k actions: Int) -> Int {
        return next(index: 0, balance: 0, buys: actions, sells: actions, hasActions: false)
    }
    
    private func next(index: Int, balance: Int, buys: Int, sells: Int, hasActions: Bool) -> Int {
        if index == count || sells == 0 {
            return balance
        }
        
        if hasActions {
            let sellChoice = next(index: index+1, balance: balance+self[index], buys: buys, sells: sells-1, hasActions: false)
            let passChoice = next(index: index+1, balance: balance, buys: buys, sells: sells, hasActions: true)
            
            return Swift.max(sellChoice, passChoice)
        } else {
            let buyChoice = next(index: index+1, balance: balance-self[index], buys: buys-1, sells: sells, hasActions: true)
            let passChoice = next(index: index+1, balance: balance, buys: buys, sells: sells, hasActions: false)
            
            return Swift.max(buyChoice, passChoice)
        }
    }
}
