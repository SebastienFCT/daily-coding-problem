### Description

This problem was asked by Facebook.

Given the mapping `a = 1, b = 2, ... z = 26`, and an encoded message, count the number of ways it can be decoded.

For example, the message `111` would give `3`, since it could be decoded as `aaa`, `ka`, and `ak`.

You can assume that the messages are decodable. For example, `001` is not allowed.

### Solution

```swift
extension String {
    func decypher() -> Int {
        let substring = String(self.prefix(2))
        
        if substring == "00" || substring == "0" {
            return 0
        }
        
        if self.count == 0 {
            return 1
        }
        
        if self.count == 1 {
            return 1
        }
        
        if let val = Int(substring) {
            if val <= 26 {
                return String(self.suffix(self.count - 1)).decypher() + String(self.suffix(self.count - 2)).decypher()
            } else {
                return String(self.suffix(self.count - 1)).decypher()
            }
        }
    
        return 0
    }
}
```