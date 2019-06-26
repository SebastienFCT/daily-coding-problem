//
//  Solution.swift
//  Problem 32
//
//  Created by sebastien FOCK CHOW THO on 2019-06-26.
//  Copyright © 2019 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

/**
 
    First let's try to explain how we understand the problem:
 
    The currency table is represented by a 2D array, this is how I understand it (values taken from the web):
 
    from    |   to      |   rate
    EUR     |   CAD     |   1.49
    CAD     |   EUR     |   0.67
    RMB     |   EUR     |   0.13
    EUR     |   RMB     |   7.82
    RMB     |   CAD     |   0.19
    CAD     |   RMB     |   5.24
    ....
 
    The goal is to be able to determine if there is any path for which with start with a certain amount of A and end up with a greater amount of A
 
    let's say that I start with 100EUR
 
    - I convert it to RMB -> 100 * 7.82 = 782
    - I convert it to CAD -> 782 * 0.19 = 148.58
    - I convert it to EUR -> 148.58 * 0.67 = 99.5486
 
    Notice that the output it lower than the input, which doesn't really make sense since I don't have any transaction cost. That also tells me that potentially I could revert this behaviour:
 
    - I convert 100EUR to CAD -> 100 * 1.49 = 149
    - to RMB -> 149 * 5.24 = 780.76
    - to EUR -> 780.76 * 0.13 = 101.4988
 
    So we just found that this is possible, how to write an algorithm that tries every possibilities?
 
    We can do this using a tree structure, suppose we're starting with EUR (and our currencies are EUR, CAD, RMB). From EUR, we have 2 possibilities:

    - convert to RMB
    - convert to CAD
 
    For each of this possibilities, we will first check if converting to EUR gives us more than the initial amount, if it does, we end our logic, otherwise we dig deeper and see what are the possibilities of each. For RMB for example:
 
    - convert to CAD
 
    Here, look again what we get by getting back to EUR.
 
    And so on...
 
    The few missing information we need are:
 
    - How do we know how to end the loop? Let's try to keep track of the currency that have already been converted to and avoid re-using them
 
    Ok now that this has been decided, let's define how a row of our currency table is defined:
 
    - id
    - fromCurrency
    - toCurrentcy
    - factor
 
    id will actually help us keeping track of the already used currencies
 
    Let's build a class that knows about the original currency, the different transactions that were proceeded, the last known currency and of course a currency table
 
 */
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
/**
 
    Now we need a function that:
 
    - runs a transaction that didn't run yet and store is in the list of transaction that ran
    - runs the result against the transaction back to the original currency
    - re-iterate
 
 */
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
/**
 
    If there is enough time to improve this code, I would do the following:
 
    - Return the list of transaction (easy since we're keeping a set of transaction, however set aren't ordered in swift so we might have to change this)
    - Return the original value and the final value
 
 */
