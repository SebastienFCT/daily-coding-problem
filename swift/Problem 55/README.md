## Description

This problem was asked by Microsoft.

Implement a URL shortener with the following methods:

- `shorten(url)`, which shortens the url into a six-character alphanumeric string, such as `zLg6wl`.
- `restore(short)`, which expands the shortened string into the original url. If no such shortened string exists, return null.

Hint: What if we enter the same URL twice?

## Solution

the format of the expected shorten URL is "zLg6wl"
 
When you look at a sequence of 6 bits, it has the format "011001", it's base 2 and each bit can be either 0 or 1

Imagine a different base where you have all the letter lowercased, all the letter upper cased and all the number from 0 to 9, it would be a base 26 + 26 + 10 = 62
    
```swift
var base64 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

struct URLShortener {
    var dictionary: [String: String]
    var reverse: [String: String]
    
    mutating func add(url: String) -> String {
        
        // If it already has the url, return the shortened version
        if reverse.keys.contains(url) {
            return reverse[url]!
        }
        
        let id = buildUniqueId()
        dictionary[id] = url
        reverse[url] = id
        
        return id
    }
    
    private func buildUniqueId() -> String {
        var result = ""
        
        // This should be an area of improvement where we control a cache and restrict how many url we're keeping
        guard Double(dictionary.count) < pow(2.0, 64) else {
            fatalError("your dictionary is full")
        }
        
        while true {
            for _ in 0...5 {
                let random = Int.random(in: 0...61)
                let randomCharacter = base64[base64.index(base64.startIndex, offsetBy: random)]
                result.append(randomCharacter)
            }
            
            if !dictionary.keys.contains(result) {
                return result
            } else {
                result = ""
            }
        }
    }
}
```

## Test

```swift
class Problem_55Tests: XCTestCase {

    func test_1() {
        var urlShortener = URLShortener(dictionary: [:], reverse: [:])
        
        let shortDailyCodingProblem = urlShortener.add(url: "https://www.dailycodingproblem.com/")
        let shortMicrosoft = urlShortener.add(url: "https://www.microsoft.com/en-ca/")
        let shortMe = urlShortener.add(url: "https://www.sebfct.com/")
        
        XCTAssert(shortDailyCodingProblem != shortMicrosoft)
        XCTAssert(shortMicrosoft != shortMe)
        XCTAssert(shortMe != shortDailyCodingProblem)
        
        XCTAssert(urlShortener.add(url: "https://www.dailycodingproblem.com/") == shortDailyCodingProblem)
        XCTAssert(urlShortener.add(url: "https://www.microsoft.com/en-ca/") == shortMicrosoft)
        XCTAssert(urlShortener.add(url: "https://www.sebfct.com/") == shortMe)
        
    }

}
```