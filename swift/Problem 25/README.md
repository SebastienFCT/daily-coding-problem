## Description

This problem was asked by Facebook.

Implement regular expression matching with the following special characters:

* `.` (period) which matches any single character
* `*` (asterisk) which matches zero or more of the preceding element

That is, implement a function that takes in a string and a valid regular expression and returns whether or not the string matches the regular expression.

For example, given the regular expression `ra.` and the string `ray`, your function should return `true`. The same regular expression on the string `raymond` should return `false`.

Given the regular expression `.*at` and the string `chat`, your function should return `true`. The same regular expression on the string `chats` should return `false`.

## Solution

Since the goal is to interpret a string, we should start building a function that read a string (that would be the regular expression) and separate its asterisks and periods

let's also build a structure that knows it can be replaced by a character or multiple characters

Finally, while parsing the regular expression, let's separate it into different parts:

- Periods
- Asterisks
- Other characters (grouped)

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
}
```

~~Ok, now, we know that the string must contain all the part of our "parsedRegex" that are non asterisks or periods and in the same order, we can check for this first:~~

At this point of the test, I thought of another way to solve this problem, I could instead build a function that compare the "rest" of a string with a regex. The function will return every time it finds a special regex character

I'll do this progressively by testing first two string, then adding periods and then asterisks.

```swift
extension String {
    func matches(_ regex: String) -> Bool {
        let comparison = self.next(regex)

        return comparison.result && comparison.rest == ""
    }

    func next(_ regex: String) -> (result: Bool, rest: String, leftRegex: String) {
        var selfCopy = self
        var regexCopy = regex

        while !regexCopy.isEmpty {
            if regexCopy.removeFirst() != selfCopy.removeFirst() {
                return (false, "", "")
            }
        }

        return (true, selfCopy, regexCopy)
    }
}
```

Now let's introduce the period character into our function, the period must match any single character

```swift
extension String {
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

            if regexCopy.removeFirst() != selfCopy.removeFirst() {
                return (false, "", "")
            }
        }

        return (true, selfCopy, regexCopy)
    }
}
```

Finally, we need the logic for the asterisk.
 
For this one, if we find an asterisk, we need to loop through the input until we find a sub-string matching the following, for example having

abc\*c and abcaac

The logic is that at the asterisk:

- remove first character of the input: the rest is ac, an ac doesn't match c
- remove the next first character: the rest is c, it matches the expression return true

```swift
extension String {
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

 We notice few issues here:
 
- If we reach the end on the asterisk condition, then there is two possibilities
    - The regex wasn't finish, therefore it should fail (we reach the end of the input)
    - The regex was at the end, in which case it should succeed. In fact, this should change the rule to "if the next regex character is a * and it's the last regex character, then return true

```swift
extension String {
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