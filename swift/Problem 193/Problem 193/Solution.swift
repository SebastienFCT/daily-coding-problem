//
//  Solution.swift
//  Problem 193
//
//  Created by sebastien FOCK CHOW THO on 2019-12-04.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

extension Array where Element == Int {
    
    typealias TransactionState = (holdingStock: Bool, profits: Int)
    
    func optimizeTransactions(withSellingFees: Int) -> Int {
        
        let initialState: TransactionState = (false, 0)
        let candidates = allTransactionPath(currentState: initialState, sellingFees: withSellingFees)
        let sorted = candidates.sorted{ $0.profits > $1.profits }
        
        return sorted.first?.profits ?? 0
    }
    
    func allTransactionPath(currentState: TransactionState, sellingFees: Int) -> [TransactionState] {
        
        var result: [TransactionState] = []
        
        if !currentState.holdingStock {
            
            result.append(currentState)
            
            for i in 0..<count {
                let state: TransactionState = (!currentState.holdingStock, currentState.profits-self[i])
                let futureTransactions = Array(suffix(count-i-1))
                result.append(contentsOf: futureTransactions.allTransactionPath(currentState: state, sellingFees: sellingFees))
            }
        } else {
            for i in 0..<count {
                let state: TransactionState = (!currentState.holdingStock, currentState.profits+self[i]-sellingFees)
                let futureTransactions = Array(suffix(count-i-1))
                result.append(contentsOf: futureTransactions.allTransactionPath(currentState: state, sellingFees: sellingFees))
            }
        }
        
        return result
    }
}
