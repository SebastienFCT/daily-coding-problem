### Description

This problem was asked by Twitter.

Implement an autocomplete system. That is, given a query string `s` and a set of all possible query strings, return all strings in the set that have `s` as a prefix.

For example, given the query string `de` and the set of strings `[dog, deer, deal]`, return `[deer, deal]`.

Hint: Try preprocessing the dictionary into a more efficient data structure to speed up queries.

### Solution

```swift
extension Array where Element == String {
    
    func autocomplete(_ prefix: String) -> [String] {
        return self.filter{ String($0.prefix(prefix.count)) == prefix }
    }
}
```