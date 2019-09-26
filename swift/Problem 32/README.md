## Description

This problem was asked by Jane Street.

Suppose you are given a table of currency exchange rates, represented as a 2D array. Determine whether there is a possible arbitrage: that is, whether there is some sequence of trades you can make, starting with some amount A of any currency, so that you can end up with some amount greater than A of that currency.

There are no transaction costs and you can trade fractional quantities.

## Solution

```swift
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
```

## Tests

```swift
class Problem_32Tests: XCTestCase {

    func test_1() {
        let currencyTable = [
            [0, "EUR", "CAD", 1.49],
            [1, "CAD", "EUR", 0.67],
            [2, "RMB", "EUR", 0.13],
            [3, "EUR", "RMB", 7.82],
            [4, "RMB", "CAD", 0.19],
            [5, "CAD", "RMB", 5.24]
        ]
        
        let currencyDebugger = CurrencyDebugger(currencyTable: currencyTable, originalCurrency: "EUR", originalValue: 100.0)
        
        print(currencyDebugger.anyDesignFlaw())
    }

    func test_2() {
        let currencyTable = [
            [0, "EUR", "CAD", 1.0],
            [1, "CAD", "EUR", 1.0],
            [2, "RMB", "EUR", 1.0],
            [3, "EUR", "RMB", 1.0],
            [4, "RMB", "CAD", 1.0],
            [5, "CAD", "RMB", 1.0]
        ]
        
        let currencyDebugger = CurrencyDebugger(currencyTable: currencyTable, originalCurrency: "EUR", originalValue: 100.0)
        
        XCTAssertFalse(currencyDebugger.anyDesignFlaw())
    }

}
```