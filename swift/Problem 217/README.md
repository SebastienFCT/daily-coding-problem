## Description

We say a number is sparse if there are no adjacent ones in its binary representation. For example, `21` (10101) is sparse, but `22` (10110) is not. For a given input `N`, find the smallest sparse number greater than or equal to `N`.

Do this in faster than `O(N log N)` time.

## Solution

```swift
extension Int {
    
    func nextSparse() -> Int {
        
        var binary = toBinary()
        
        while !binary.isSparse() {
            let next = binary.binaryToInt() + 1
            binary = next.toBinary()
        }
        
        return binary.binaryToInt()
    }
}

extension Array where Element == Int {
    
    
    
    func isSparse() -> Bool {
        
        for i in 0..<count {
            
            if self[i] == 1 {
                if i > 0 {
                    if self[i-1] == 1 {
                        return false
                    }
                }
                
                if i < count-1 {
                    if self[i+1] == 1 {
                        return false
                    }
                }
            }
        }
        
        return true
    }
}

// Binary converters

extension Int {
    func toBinary() -> [Int] {
        
        var result: [Int] = []
        
        let binary = String(self, radix: 2)
        
        for item in binary {
            result.append(Int(String(item))!)
        }
        
        return result
    }
}

extension Array where Element == Int {
    
    func binaryToInt() -> Int {
        
        var binary = ""
        
        forEach { (item) in
            binary += String(item)
        }
        
        guard let value = Int(binary, radix: 2) else {
            fatalError("Could not convert binary")
        }
        
        return value
    }
}
```

## Test

```swift
class Problem_217Tests: XCTestCase {

    func test_binary_converter() {
        print(123.toBinary())
        print([1, 1, 1, 1, 0, 1, 1].binaryToInt())
    }
    
    func test_is_sparse() {
        print([1, 1, 1, 1, 0, 1, 1].isSparse())
        print([1, 0, 0, 0, 0, 0, 1].isSparse())
        print([1, 0, 1].isSparse())
    }
    
    func test_example() {
        let input = 21
        let expected = 21
        let actual = input.nextSparse()
        
        XCTAssert(actual == expected)
    }
    
    func test_example_2() {
        let input = 22
        let actual = input.nextSparse()
        
        XCTAssert(actual != 22)
    }

}
```