## Description

This problem was asked by Snapchat.

Given a string of digits, generate all possible valid IP address combinations.

IP addresses must follow the format A.B.C.D, where A, B, C, and D are numbers between 0 and 255. Zero-prefixed numbers, such as 01 and 065, are not allowed, except for 0 itself.

For example, given "2542540123", you should return ['254.25.40.123', '254.254.0.123'].

## Solution

```swift
extension String {
    
    func ipCandidates() -> [String] {
        
        var result: [String] = []
        
        let candidates = next(current: [], part: 1)
        
        for candidate in candidates {
            var output = ""
            
            for i in 0..<candidate.count {
                
                if i > 0 { output = "\(output)." }
                output = "\(output)\(candidate[i].first ?? "")"
            }
            
            result.append(output)
        }
        
        return result
    }
    
    private func next(current: [[[String]]], part: Int) -> [[[String]]] {
        
        var result: [[[String]]] = []
        
        if part == 4 {
            if self.count > 4 { return [] }
            
            for candidate in current {
                var copy = candidate
                
                if self.isValidIpPartRange() {
                    copy.append([self])
                    
                    result.append(copy)
                }
            }
        } else {
            
            let limit = min(3, count)
            
            for i in 1...limit {
                
                var batch: [[[String]]] = []
                
                if part == 1 {
                    let newInput: [String] = ["\(self.prefix(i))"]
                    
                    batch.append([newInput])
                } else {
                    for candidate in current {
                        
                        var copy = candidate
                        let value = "\(self.prefix(i))"
                        
                        if value.isValidIpPartRange() {
                            copy.append([value])
                            batch.append(copy)
                        }
                    }
                }
                
                let rest = "\(self.suffix(count-i))"
                
                result.append(contentsOf: rest.next(current: batch, part: part+1))
            }
            
        }
        
        return result
    }
    
    private func isValidIpPartRange() -> Bool {
        
        if self.first! == "0" && self.count > 1 { return false }
        
        if count > 3 { return false }
        
        let limit = min(3, count)
        var intVal = 0
        
        for i in 0...limit-1 {
            let copy = self.prefix(count-i)
            
            let power = pow(10.0, Double(i))
            let current = Int(String(copy.last!)) ?? 0
            
            intVal += current * Int(power)
        }
        
        if intVal > 255 { return false }
        
        return true
    }
}
```

## Test

```swift
class Problem_213Tests: XCTestCase {

    func test_example() {
        let input = "2542540123"
        let expected = ["254.25.40.123", "254.254.0.123"]
        let actual = input.ipCandidates()
        
        XCTAssert(actual == expected)
    }

}
```