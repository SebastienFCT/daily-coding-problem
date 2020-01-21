## Description

This problem was asked by Palantir.

In academia, the h-index is a metric used to calculate the impact of a researcher's papers. It is calculated as follows:

A researcher has index `h` if at least `h` of her `N` papers have h citations each. If there are multiple `h` satisfying this formula, the maximum is chosen.

For example, suppose `N = 5`, and the respective citations of each paper are `[4, 3, 0, 1, 5]`. Then the h-index would be `3`, since the researcher has `3` papers with at least `3` citations.

Given a list of paper citations of a researcher, calculate their h-index.

## Solution

```swift
struct Academia {
    
    func hIndex(papers n: Int, citations h: [Int]) -> Int {
        
        guard h.count == n else {
            fatalError("citation(s) missing for at least 1 paper")
        }
        
        for i in stride(from: n, through: 0, by: -1) {
            
            let filtered = h.filter{ $0 >= i }
            
            if filtered.count >= i {
                return i
            }
        }
        
        return 0
    }
}
```

## Tests

```swift
class Problem_241Tests: XCTestCase {

    func test_example() {
        let academia = Academia()
        
        XCTAssert(academia.hIndex(papers: 5, citations: [4,3,0,1,5]) == 3)
    }

}
```