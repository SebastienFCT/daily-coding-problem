## Description

This problem was asked by Epic.

The "look and say" sequence is defined as follows: beginning with the term 1, each subsequent term visually describes the digits appearing in the previous term. The first few terms are as follows:

```
1
11
21
1211
111221
```

As an example, the fourth term is `1211`, since the third term consists of one `2` and one `1`.

Given an integer `N`, print the `N`th term of this sequence.


## Solution

```swift
struct LookAndSee {
    
    func get(n: Int) -> Int {
        
        var current = 1
        
        for _ in 2...n {
            current = next(current: current)
        }
        
        return current
    }
    
    private func next(current: Int) -> Int {
        
        var result = ""
        
        let value = "\(current)"
        
        var element: Int? = nil
        var count: Int? = nil
        
        for digit in value {
            
            let digitVal = Int(String(digit))
            
            if element == nil {
                element = digitVal
                count = 1
                continue
            }
            
            if element == digitVal {
                count! += 1
                continue
            }
            
            result += "\(count!)\(element!)"
            element = digitVal
            count = 1
        }
        
        if element != nil {
            result += "\(count!)\(element!)"
        }
        
        return Int(result)!
    }
}
```

## Tests

```swift
class Problem_275Tests: XCTestCase {

    func test_example() {
        
        let las = LookAndSee()
        let expected = 1211
        let actual = las.get(n: 4)
        
        XCTAssert(actual == expected)
    }

}
```