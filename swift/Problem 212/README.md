## Description

This problem was asked by Dropbox.

Spreadsheets often use this alphabetical encoding for its columns: "A", "B", "C", ..., "AA", "AB", ..., "ZZ", "AAA", "AAB", ....

Given a column number, return its alphabetical column id. For example, given `1`, return "A". Given `27`, return "AA".

## Solution

```swift
struct Spreadsheet {
    
    var abc = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K" , "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    func columnName(value: Int) -> String {
        
        var result = ""
        
        var current = value
        
        while current > 26 {
            
            let residue = current / 26
            current -= residue * 26
            
            result += abc[residue-1]
            
        }
        
        if current > 0 {
            result += abc[current-1]
        }
        
        
        return result
    }
}
```

## Test

```swift
class Problem_212Tests: XCTestCase {

    func test_example_1() {
        let spreadsheetManager = Spreadsheet()
        
        let actual = spreadsheetManager.columnName(value: 1)
        let expected = "A"
        
        XCTAssert(actual == expected)
    }
    
    func test_example_2() {
        let spreadsheetManager = Spreadsheet()
        
        let actual = spreadsheetManager.columnName(value: 27)
        let expected = "AA"
        
        XCTAssert(actual == expected)
    }

}
```