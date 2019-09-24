## Description

This problem was asked by Facebook.

Implement regular expression matching with the following special characters:

* `.` (period) which matches any single character
* `*` (asterisk) which matches zero or more of the preceding element

That is, implement a function that takes in a string and a valid regular expression and returns whether or not the string matches the regular expression.

For example, given the regular expression `ra.` and the string `ray`, your function should return `true`. The same regular expression on the string `raymond` should return `false`.

Given the regular expression `.*at` and the string `chat`, your function should return `true`. The same regular expression on the string `chats` should return `false`.

## Solution

```swift
class Asterisk {
    var value: String?
    
    init() {
        self.value = nil
    }
}

class Period {
    var value: Character?
    
    init() {
        self.value = nil
    }
}

extension String {
    func parseRegex() -> [Any] {
        var result: [Any] = []

        var nextPart = ""
        for character in self {
            if character == "*" {
                if !nextPart.isEmpty {
                    result.append(nextPart)
                    nextPart = ""
                }
                result.append(Asterisk())
                continue
            }

            if character == "." {
                if !nextPart.isEmpty {
                    result.append(nextPart)
                    nextPart = ""
                }
                result.append(Period())
                continue
            }

            nextPart += String(character)
        }

        if !nextPart.isEmpty {
            result.append(nextPart)
            nextPart = ""
        }

        for element in result {
            print(element)
        }
        
        return result
    }
    
    func matches(_ regex: String) -> Bool {
        let comparison = self.next(regex)
        
        return comparison.result && comparison.rest == ""
    }
    
    func next(_ regex: String) -> (result: Bool, rest: String, leftRegex: String) {
        var selfCopy = self
        var regexCopy = regex
        
        while !regexCopy.isEmpty {
            if regexCopy.first == "." {
                regexCopy.removeFirst()
                selfCopy.removeFirst()
                
                return selfCopy.next(regexCopy)
            }
            
            if regexCopy.first == "*" {
                if regexCopy.count == 1 {
                    return (true, "", "")
                }
                
                regexCopy.removeFirst()
                selfCopy.removeFirst()
                while !selfCopy.isEmpty {
                    if selfCopy.next(regexCopy).result {
                        return selfCopy.next(regexCopy)
                    }
                    selfCopy.removeFirst()
                }
                
                return (false, "", "")
            }
            
            if regexCopy.removeFirst() != selfCopy.removeFirst() {
                return (false, "", "")
            }
        }
        
        return (true, selfCopy, regexCopy)
    }
}
```

## Tests

```swift
class Problem_25Tests: XCTestCase {

    func test_1() {
        XCTAssertTrue("hello world".matches("hello world"))
        XCTAssertFalse("hello wolrd".matches("hello"))
        XCTAssertFalse("hello wolrd".matches("world"))
    }
    
    func test_2() {
        XCTAssertTrue("hello world".matches("hello.world"))
        XCTAssertTrue("hello world".matches("he.l. w.rld"))
        XCTAssertFalse("hello world".matches("hello .world"))
    }
    
    func test_3() {
        XCTAssertTrue("hello world".matches("hello*ld"))
        XCTAssertTrue("hello world".matches("hello*"))
        XCTAssertFalse("hello world".matches("hello*XYZ"))
    }

}
```