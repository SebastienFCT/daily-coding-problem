## Description

This problem was asked by Google.

The edit distance between two strings refers to the minimum number of character `insertions`, `deletions`, and `substitutions` required to change one string to the other. For example, the edit distance between `kitten` and `sitting` is `three`: substitute the `k` for `s`, substitute the `e` for `i`, and append a `g`.

Given two strings, compute the edit distance between them.

## Solution

Let's try to solve this problem step by step.

We're trying to change a string into another one with a minimum of steps.

What are our rules?

- If the output is longer than the input, we will have to add the difference
- If the output is shorter, we will have to delete the difference
- If some characters are similar, they should be kept in place to avoid substitution

For example, if we start we an easy problem:

- input = "", output = "hello" -> the output is longer, we will have to add 4 letters, in this case there is no pre-existing letter so we add the letter in the order of the output. Edit distance = output.length

- input = "hello world", output = "hello" -> the output is shorter, we will have to delete the difference but prior to this we need to run a function that find the closest string (defined by how many common character they have) -> if finds hello with difference = 0, it removes " world". Edit distance = " world".length

- input = "el", output = "hello" -> the output is longer, we run the same function that finds the closest string, it returns "el" (and notice here that it also need to return at which index it's located in the output -aka index = 1), we run a function that completes the string

Let's start with a function that finds the closest sub-string between two strings

```swift
extension String {
    func closestSubString(toExpectedOutput output: String) -> (result: String, startingAtIndex: Int, withEditDist: Int) {
        guard self.count >= output.count else {
            fatalError("self must be > than the input")
        }
        
        var result = ("", 0, Int.max)
        // Between "abcde" and "te", there is "ab", "bc", "cd" and "de" -aka 4- possibilities
        // Between "abcde" and "tec", there is "abc", "bcd", "cde" -aka 3- possibilities
        // Between "abcde" and "tecd", there is "abcd", "bcde" -aka 2- possibilities
        
        // There are (size of input - size of output) + 1 possibilitie(s) (this part might be wrong be seem right)... It could be confirmed via math combinations equations
        
        for i in 0..<(self.count - output.count + 1) {
            let start = self.index(self.startIndex, offsetBy: i)
            let end = self.index(self.endIndex, offsetBy: -(self.count-output.count-i))
            let range = start..<end
            
            let subSelf = self[range]
            let subSelfEditDist = String(subSelf).differencesWith(output)
            
            if subSelfEditDist < result.2 {
                result = (String(subSelf), i, subSelfEditDist)
            }
        }
        
        return result
    }
    
    func differencesWith(_ value: String) -> Int {
        var result = 0
        for i in 0..<self.count {
            if self[self.index(self.startIndex, offsetBy: i)] != value[value.index(value.startIndex, offsetBy: i)] {
                result += 1
            }
        }
        
        return result
    }
}
```

That was fun! We now have a function that finds the closest sub-string from an input A to an expected output B
 
Let's build our main function that determines if there is any difference between two string, if yes uses the previous function to find their closest sub-strings and then add/remove and substitute elements

```
extension String {
    func editDistance(toOutput output: String) -> Int {
        
        if self.count < output.count {
            return output.editDistance(toOutput: self)
        }
        
        if self.count > output.count {
            let closest = closestSubString(toExpectedOutput: output)
            
            return closest.withEditDist + (self.count - closest.result.count)
        }
        
        var result = 0
        
        for i in 0..<self.count {
            if self[self.index(self.startIndex, offsetBy: i)] != output[output.index(output.startIndex, offsetBy: i)] {
                result += 1
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_31Tests: XCTestCase {

    func test_1() {
        let input = "hello world"
        print(input.closestSubString(toExpectedOutput: "ld"))
    }
    
    func test_2() {
        let input = "kitten"
        print(input.editDistance(toOutput: "sitting"))
    }
}
```