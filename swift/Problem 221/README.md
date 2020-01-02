## Description

This problem was asked by Zillow.

Let's define a "sevenish" number to be one which is either a power of `7`, or the sum of unique powers of `7`. The first few sevenish numbers are `1`, `7`, `8`, `49`, and so on. Create an algorithm to find the `n`th sevenish number.


## Solution

```swift
struct Sevenish {
    
    func getValue(atIndex index: Int) -> Int {
        
        var list: [Int] = []
        
        var count = 0
        while list.count < index+1 {
            
            let newValue = Int(pow(7, Double(count)))
            var copy = list
            copy.append(newValue)
            for item in list {
                if item % 7 == 0 || item == 1 {
                    copy.append(newValue + item)
                }
            }
            
            list = copy
            count += 1
        }
        
        return list[index]
    }
}
```

## Test

```swift
class Problem_221Tests: XCTestCase {

    func test_sevenish() {
        XCTAssert(Sevenish().getValue(atIndex: 0) == 1)
        XCTAssert(Sevenish().getValue(atIndex: 1) == 7)
        XCTAssert(Sevenish().getValue(atIndex: 2) == 8)
        XCTAssert(Sevenish().getValue(atIndex: 3) == 49)
    }

}
```