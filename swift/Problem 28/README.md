## Description

This problem was asked by Palantir.

Write an algorithm to justify text. Given a sequence of words and an integer line length `k`, return a list of strings which represents each line, fully justified.

More specifically, you should have as many words as possible in each line. There should be at least one space between each word. Pad extra spaces when necessary so that each line has exactly length `k`. Spaces should be distributed as equally as possible, with the extra spaces, if any, distributed starting from the left.

If you can only fit one word on a line, then you should pad the right-hand side with spaces.

Each word is guaranteed not to be longer than `k`.

For example, given the list of words `["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]` and `k = 16`, you should return the following:

```
["the  quick brown", # 1 extra space on the left
"fox  jumps  over", # 2 extra spaces distributed evenly
"the   lazy   dog"] # 4 extra spaces distributed evenly
```

## Solution

Ok here the problem is to "organize" an array of string into a matrix of string (array of array)
 
There are a lot of rules to follow, and we should do them progressively

Let's start our function by scanning the input and returning a matrix of string with the following first rule:

- Each string has to be suffixed by at least one space

```swift
extension Array where Element == String {
    func justify(withMaxLength length: Int) -> [[String]] {
        var result: [[String]] = []

        var row: [String] = []
        var rowContent = ""

        for word in self {
            if rowContent.count + (row.count-1) + word.count > length {
                result.append(row)
                row = []
                rowContent = ""
            }

            row.append(word)
            rowContent += word
        }

        if row.count > 0 {
            result.append(row)
        }

        return result
    }
}
```

Ok, now from this piece of code, we want to add the spaces appropriately, we already included the logic for spaces between the words : `rowContent.count + (row.count-1) + word.count > length` means
 
> if the length of all the words together + the an additional space for each word but the last + the length of the new word are greater than my maximum length then...

That means that we can add the spaces to each word but the last one already

Let's add the following rule:

- If there are extra spaces, then start adding them one by one to each word

I would also separate the previous code to keep it clear

```swift
extension Array where Element == String {
    func justify(withMaxLength length: Int) -> [[String]] {
        var matrix = getMatrixForJustifying(withMaxLenght: length)

        for i in 0...matrix.count-1 {
            var row = matrix[i]

            let remainingSpace = length - row.reduce(0, { $0 + $1.count })

            var wordIndex = 0

            if remainingSpace > 0 {
                for _ in 0...remainingSpace-1 {
                    row[wordIndex] += " "

                    wordIndex += 1
                    if wordIndex == row.count-1 { wordIndex = 0 }
                }
            }

            matrix[i] = row
        }

        return matrix
    }

    func getMatrixForJustifying(withMaxLenght length: Int) -> [[String]] {
        var result: [[String]] = []

        var row: [String] = []
        var rowContent = ""

        for word in self {
            if rowContent.count + (row.count-1) + word.count > length {
                result.append(row)
                row = []
                rowContent = ""
            }

            row.append(word)
            rowContent += word
        }

        if row.count > 0 {
            result.append(row)
        }

        return result
    }
}
```

To test the following rule:
 
> If you can only fit one word on a line, then you should pad the right-hand side with spaces.

I'm running the code against a single word and it fails, this can be fixed by detecting a single word in a row and appending the remaining space directly:

```swift
extension Array where Element == String {
    func justify(withMaxLength length: Int) -> [[String]] {
        var matrix = getMatrixForJustifying(withMaxLenght: length)
        
        for i in 0...matrix.count-1 {
            var row = matrix[i]
            
            let remainingSpace = length - row.reduce(0, { $0 + $1.count })
            
            if row.count == 1 {
                row[0] += String(repeating: " ", count: remainingSpace)
                matrix[i] = row
                continue
            }
            
            var wordIndex = 0
            
            if remainingSpace > 0 {
                for _ in 0...remainingSpace-1 {
                    row[wordIndex] += " "
                    
                    wordIndex += 1
                    if wordIndex == row.count-1 { wordIndex = 0 }
                }
            }
            
            matrix[i] = row
        }
        
        return matrix
    }
    
    func getMatrixForJustifying(withMaxLenght length: Int) -> [[String]] {
        var result: [[String]] = []
        
        var row: [String] = []
        var rowContent = ""
        
        for word in self {
            if rowContent.count + (row.count-1) + word.count > length {
                result.append(row)
                row = []
                rowContent = ""
            }
            
            row.append(word)
            rowContent += word
        }
        
        if row.count > 0 {
            result.append(row)
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_28Tests: XCTestCase {

    func test_1() {
        let input = ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]
        let length = 16
        
        XCTAssert(input.justify(withMaxLength: length) == [["the  ", "quick ", "brown"], ["fox  ", "jumps  ", "over"], ["the   ", "lazy   ", "dog"]])
    }
    
    func test_2() {
        let input = ["test"]
        let length = 16
        
        XCTAssert(input.justify(withMaxLength: length) == [["test            "]])
    }

}
```