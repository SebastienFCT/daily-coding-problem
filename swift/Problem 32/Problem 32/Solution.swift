//
//  Solution.swift
//  Problem 32
//
//  Created by sebastien FOCK CHOW THO on 2019-06-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

class CurrencyDebugger {
    var currencyTable: [[Any]]
    var transactions: Set<Int>
    var originalCurrency: String
    var originalValue: Double
    var currentCurrency: String
    var currentValue: Double
    
    
    init(currencyTable: [[Any]], originalCurrency: String, originalValue: Double) {
        self.currencyTable = currencyTable
        self.transactions = Set()
        self.originalCurrency = originalCurrency
        self.currentCurrency = originalCurrency
        self.originalValue = originalValue
        self.currentValue = originalValue
    }
}

extension CurrencyDebugger {
    func anyDesignFlaw() -> Bool {
        return anyDesignFlaw(transactions: transactions, originalCurrency: originalCurrency, originalValue: originalValue, currentCurrency: currentCurrency, currentValue: currentValue)
    }
    
    private func anyDesignFlaw(transactions: Set<Int>, originalCurrency: String, originalValue: Double, currentCurrency: String, currentValue: Double) -> Bool {
        
        let possibilities = currencyTable.filter{ !transactions.contains($0.first as! Int) && $0[2] as! String != originalCurrency }
        
        if possibilities.isEmpty {
            return false
        }
        
        for possibility in possibilities {
            let newValue = currentValue * (possibility[3] as! Double)
            let newCurrency = possibility[2] as! String
            var newTransaction = transactions
            newTransaction.insert(possibility[0] as! Int)
            
            let backTransactions = currencyTable.filter{ $0[1] as! String == currentCurrency && $0[2] as! String == originalCurrency }
            if let backTransaction = backTransactions.first {
                if currentValue * (backTransaction[3] as! Double) > originalValue {
                    return true
                }
            }
            
            if anyDesignFlaw(transactions: newTransaction, originalCurrency: originalCurrency, originalValue: originalValue, currentCurrency: newCurrency, currentValue: newValue) {
                return true
            }
        }
        
        return false
    }
}
