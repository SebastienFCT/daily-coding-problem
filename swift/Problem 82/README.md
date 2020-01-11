## Description

This problem was asked Microsoft.

Using a `read7()` method that returns `7` characters from a file, implement `readN(n)` which reads `n` characters.

For example, given a file with the content `Hello world`, three `read7()` returns `Hello w`, `orld` and then `""`.

## Solution

```swift
struct MicrosoftChallenge {
    var filename: String
    var ext: String
    
    var count = 0
    var remaining = ""
    
    mutating func read7() -> String? {
        
        if let bundle = Bundle(identifier: "com.sebfct.Problem-82"), let path = bundle.url(forResource: filename, withExtension: ext) {
            
            if let content = try? String(contentsOf: path, encoding: .utf8) {
                count += 1
                let text = String(content.prefix(count * 7))
                return String(text.suffix(7))
            }
        }
        
        return nil
    }
    
    // Utitility function to call once the multiple reading is done
    
    mutating func reset() {
        count = 0
    }
    
    mutating func readN(n: Int) -> String {
        // Handle the case where remaining is not empty
        if !remaining.isEmpty {
            let copy = remaining
            remaining = ""
            return "\(copy)\(readN(n: n-copy.count))"
        }
        
        var result = ""
        
        // This limit corresponds to "how many time do I have to run read7()?"
        let limit = (n%7 == 0) ? (n / 7) : (n / 7) + 1
        
        for _ in 1...limit {
            if let intermediate = read7() {
                result.append(intermediate)
            }
        }
        
        // Best case: If N is a multiple of 7, we just return the rest
        if n % 7 == 0 {
            return result
        } else {
            // If the other case, we need to properly set the remaining so that if the user reads again it will be taken into consideration
            if n > 7 {
                remaining = String(result.suffix((n%7)+1))
                return String(result.prefix(n))
            } else {
                remaining = String(result.suffix(7-n+1))
                return String(result.prefix(n))
            }
        }
    }
}
```

## Test

```swift
class Problem_82Tests: XCTestCase {

    func test_1() {
        var mc = MicrosoftChallenge(filename: "sample", ext: "md", count: 0, remaining: "")
        XCTAssert(mc.read7() == "This is")
        XCTAssert(mc.read7() == " a samp")
        XCTAssert(mc.read7() == "le file")
        mc.reset()
        XCTAssert(mc.read7() == "This is")
    }
    
    func test_2() {
        var mc = MicrosoftChallenge(filename: "sample", ext: "md", count: 0, remaining: "")
        XCTAssert(mc.readN(n: 10) == "This is a ")
        XCTAssert(mc.readN(n: 10) == "sample fil")
        XCTAssert(mc.readN(n: 10) == "le for tes")
    }

}
```