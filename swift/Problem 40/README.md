## Description

This problem was asked by Google.

Given an array of integers where every integer occurs three times except for one integer, which only occurs once, find and return the non-duplicated integer.

For example, given `[6, 1, 3, 3, 3, 6, 6]`, return `1`. Given `[13, 19, 13, 13]`, return `19`.

Do this in `O(N)` time and `O(1)` space.

## Solution

I wasn't able to solve this problem. After googling a little, I found multiple explanation with bitwise operation.
 
Bit operation isn't something I'm really familiar with, the following link https://www.youtube.com/watch?v=mHfvInveXDQ illustrates the solution

```swift
extension Array where Element == Int {
    func findUniqueOccurence(regularOccurence: Int) -> UInt {
        // First we're creating an array of bit, this will represent the sum of all the values
        var bitCounts = Array(repeating: 0, count: 64)
        
        // For each integer in the array, we're incrementing the binary to our bitCounts
        for element in self {
            let value = String(fullBinary: element)
            let toBits = value.map{ Int(String($0)) ?? 0 }
            bitCounts = zip(bitCounts, toBits).map{ $0 + $1 }
        }
        
        // We map our bitCounts to an array of its values % <how many times a value is supposed to occur>
        // This is where all the magic happens, I didn't really take to understand why, but this works. Example:
        // [1, 1, 1, 2]
        // b1 = 01
        // b2 = 10
        // sum = [3, 1] (01 + 10 + 10 + 10)
        // map = [3%3, 1%3] = 01
        // b01 to int = 2
        for i in 0..<bitCounts.count {
            bitCounts[i] = bitCounts[i] % regularOccurence
        }
        
        // We're mapping the result to a string so that we can convert it to an int
        let result = bitCounts.map{ String($0) }.joined()
        
        return strtoul(result, nil, 2)
    }
}

extension String {
    init<B: FixedWidthInteger>(fullBinary value: B) {
        self = value.words.reduce(into: "") {
            $0.append(contentsOf: repeatElement("0", count: $1.leadingZeroBitCount))
            $0.append(String($1, radix: 2))
        }
    }
}
```

Swift provides an built-in feature for reading binaries: by prefixing the binary with 0b
 
0b10 = 2

## Tests

```swift
class Problem_40Tests: XCTestCase {

    func test_1() {
        let input = [6, 1, 3, 3, 3, 6, 6]
        XCTAssert(input.findUniqueOccurence(regularOccurence: 3) == 1)
    }
    
    func test_2() {
        let input = [13, 19, 13, 13]
        XCTAssert(input.findUniqueOccurence(regularOccurence: 3) == 19)
    }

}
```