## Description

This problem was asked by Stripe.

Write a function to flatten a nested dictionary. Namespace the keys with a period.

For example, given the following dictionary:

```
{
    "key": 3,
    "foo": {
        "a": 5,
        "bar": {
            "baz": 8
        }
    }
}
```

it should become:

```
{
    "key": 3,
    "foo.a": 5,
    "foo.bar.baz": 8
}
```

You can assume keys do not contain dots in them, i.e. no clobbering will occur.

## Solution

```swift
extension Dictionary where Key == String, Value == Any {
    
    func flatten() -> [String: Any] {
        var result: [String: Any] = [:]
        
        for key in self.keys {
            if let value = self[key] as? [String: Any] {
                let flattened = value.flatten()
                
                for subKey in flattened.keys {
                    let combine = "\(key).\(subKey)"
                    result[combine] = flattened[subKey]
                }
            } else {
                result[key] = self[key]
            }
        }
        
        return result
    }
}
```

## Test

```swift
class Problem_173Tests: XCTestCase {

    func test_example() {
        let input: [String: Any] = [
            "key": 3,
            "foo": [
                "a" : 5,
                "bar" : [
                    "baz": 8
                ]
            ]
        ]
        
        let result = input.flatten()
        XCTAssert(result.keys.contains("key"))
        XCTAssert(result.keys.contains("foo.a"))
        XCTAssert(result.keys.contains("foo.bar.baz"))
        XCTAssert(result.keys.count == 3)
        
        print(result)
    }

}
```