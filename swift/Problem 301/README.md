## Description

This problem was asked by Triplebyte.

Implement a data structure which carries out the following operations without resizing the underlying array:

- add(value): Add a value to the set of values.
- check(value): Check whether a value is in the set.

The check method may return occasional false positives (in other words, incorrectly identifying an element as part of the set), but should always correctly identify a true element.

## Solution

```swift
struct TripleByteCustomStruct {
    
    var key: SymmetricKey
    var box: AES.GCM.SealedBox? = nil
    
    mutating func add(value: String) {
        
        if let box = box, let decrypted = try? AES.GCM.open(box, using: key), var compound = String(data: decrypted, encoding: .utf8) {
            
            compound = "\(compound)\(value)"
            
            self.box = encrypt(value: compound)
            return
        }
        
        guard let data = value.data(using: .utf8), let cryptedBox = try? AES.GCM.seal(data, using: key), let sealedBox = try? AES.GCM.SealedBox(combined: cryptedBox.combined!) else {
            fatalError("couldn't encrypt value")
        }
        
        self.box = sealedBox
    }
    
    func check(value: String) -> Bool {
        
        if let box = box, let decrypted = try? AES.GCM.open(box, using: key), let compound = String(data: decrypted, encoding: .utf8) {
            
            return compound.contains(value)
        }
        
        return false
    }
    
    private func encrypt(value: String) -> AES.GCM.SealedBox {
        
        guard let data = value.data(using: .utf8), let cryptedBox = try? AES.GCM.seal(data, using: key), let sealedBox = try? AES.GCM.SealedBox(combined: cryptedBox.combined!) else {
            fatalError("couldn't encrypt value")
        }
        
        return sealedBox
    }
}
```

## Tests

```swift
class Problem_301Tests: XCTestCase {

    func test_custom_struct() {
        
        var input = TripleByteCustomStruct(key: SymmetricKey(size: .bits256))
        
        XCTAssertFalse(input.check(value: "test 1"))
        input.add(value: "test 1")
        XCTAssertTrue(input.check(value: "test 1"))
        XCTAssertFalse(input.check(value: "test 2"))
        input.add(value: "test 2")
        XCTAssertTrue(input.check(value: "test 2"))
        XCTAssertFalse(input.check(value: "test 3"))
        input.add(value: "test 4")
        XCTAssertFalse(input.check(value: "test 3"))
        
        // This is a false positive (acceptable by the question)
        XCTAssertTrue(input.check(value: "test"))
    }

}
```