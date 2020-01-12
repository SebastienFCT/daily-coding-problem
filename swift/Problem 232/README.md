## Description

This problem was asked by Google.

Implement a `PrefixMapSum` class with the following methods:

- `insert(key: str, value: int)`: Set a given key's value in the map. If the key already exists, overwrite the value.
- `sum(prefix: str)`: Return the sum of all values of keys that begin with a given prefix.

For example, you should be able to run the following code:

```
mapsum.insert("columnar", 3)
assert mapsum.sum("col") == 3

mapsum.insert("column", 2)
assert mapsum.sum("col") == 5
```

## Solution

```swift
struct PrefixMap {
    var map: [String: Int]
    
    mutating func insert(key: String, value: Int) {
        map[key] = value
    }
    
    func sum(prefix: String) -> Int {
        var result = 0
        
        let keys = map.keys
        let filteredKeys = keys.filter{ $0[0...prefix.count-1] == prefix }
        
        for key in filteredKeys {
            result += map[key]!
        }
        
        return result
    }
}

// Utilities

public extension String {
  subscript(value: Int) -> Character {
    self[index(at: value)]
  }
}

public extension String {
  subscript(value: NSRange) -> Substring {
    self[value.lowerBound..<value.upperBound]
  }
}

public extension String {
  subscript(value: CountableClosedRange<Int>) -> Substring {
    self[index(at: value.lowerBound)...index(at: value.upperBound)]
  }

  subscript(value: CountableRange<Int>) -> Substring {
    self[index(at: value.lowerBound)..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeUpTo<Int>) -> Substring {
    self[..<index(at: value.upperBound)]
  }

  subscript(value: PartialRangeThrough<Int>) -> Substring {
    self[...index(at: value.upperBound)]
  }

  subscript(value: PartialRangeFrom<Int>) -> Substring {
    self[index(at: value.lowerBound)...]
  }
}

private extension String {
  func index(at offset: Int) -> String.Index {
    index(startIndex, offsetBy: offset)
  }
}
```

## Tests

```swift
class Problem_232Tests: XCTestCase {

    func test_prefixMap() {
        
        var pmap = PrefixMap(map: [:])
        
        pmap.insert(key: "x_1", value: 1)
        pmap.insert(key: "x_2", value: 2)
        pmap.insert(key: "x_3", value: 12)
        pmap.insert(key: "x_4", value: 21)
        
        pmap.insert(key: "y_1", value: 3)
        pmap.insert(key: "y_2", value: 7)
        pmap.insert(key: "y_3", value: 33)
        pmap.insert(key: "y_4", value: -1)
        
        XCTAssert(pmap.sum(prefix: "x") == 36)
        XCTAssert(pmap.sum(prefix: "y") == 42)
    }

}
```