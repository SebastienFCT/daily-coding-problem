## Description

This problem was asked by Square.

The Sieve of Eratosthenes is an algorithm used to generate all prime numbers smaller than `N`. The method is to take increasingly larger prime numbers, and mark their multiples as composite.

For example, to find all primes less than 100, we would first mark `[4, 6, 8, ...]` (multiples of two), then `[6, 9, 12, ...]` (multiples of three), and so on. Once we have done this for all primes less than `N`, the unmarked numbers that remain will be prime.

Implement this algorithm.

Bonus: Create a generator that produces primes indefinitely (that is, without taking `N` as an input).

## Solution

```swift
struct SieveOfEratosthenes {
    
    func primes(before: Int) -> [Int] {
        
        var result: [Int] = []
        var nonPrimes: Set<Int> = Set()
        
        for i in 2..<before {
            if !nonPrimes.contains(i) {
                result.append(i)
            }
            
            var index = result.last! + result.last!
            
            while index < before {
                nonPrimes.insert(index)
                index += result.last!
            }
        }
        
        return result
    }
}
```

Extra:

```swift
func allPrimes(count: Int) {
        
        var index = 2
        var iteration = 0
        var list: [Int] = []
        
        while iteration < count {
            if !list.contains(where: { (item) -> Bool in
                return index % item == 0
            }) {
                print(index)
                iteration += 1
                list.append(index)
            }
            
            index += 1
        }
    }
```

## Tests

```swift
class Problem_244Tests: XCTestCase {

    func test_sieve_or_erastosthenes() {
        
        let soe = SieveOfEratosthenes()
        
        XCTAssert(soe.primes(before: 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97])
    }

}
```