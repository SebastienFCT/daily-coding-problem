## Description

This problem was asked by Square.

Given a list of words, return the shortest unique prefix of each word. For example, given the list:

- dog
- cat
- apple
- apricot
- fish

Return the list:

- d
- c
- app
- apr
- f

## Solution

```swift
class SquareChallenge {
    var input: [String]
    
    var map: (input: [String], output: [String])
    var outputKeys: [String]
    var outputValues: [String]
    
    init(input: [String]) {
        self.input = input
        
        self.map = (input, input.map{ String($0.prefix(1)) })
        self.outputKeys = []
        self.outputValues = []
        
        process()
    }
    
    private func process() {
        
        while !map.output.isEmpty {
            
            var index = 0
            
            while index < map.output.count {
                var copyKeys = map.input
                var copyValues = map.output
                
                let currentKey = copyKeys.remove(at: index)
                let currentValue = copyValues.remove(at: index)

                if !copyValues.contains(currentValue) {
                    map.input.remove(at: index)
                    map.output.remove(at: index)
                    
                    outputKeys.append(currentKey)
                    outputValues.append(currentValue)
                } else {
                    index += 1
                }
            }
            
            if map.output.count > 0 {
                let newLength = map.output[0].count + 1
                
                let newOutput = map.input.map{ String($0.prefix(newLength)) }
                let newMap = (map.input, newOutput)
                
                self.map = newMap
            }
        }
    }
    
    func log() -> String {
        var result = ""
        
        for i in 0..<outputKeys.count {
            result += "\(outputKeys[i]) => \(outputValues[i])\n"
        }
        
        return result
    }
    
}
```

## Test

```swift
class Problem_162Tests: XCTestCase {

    func test_example() {
        let prefixGenerator = SquareChallenge(input: ["dog", "cat", "apple", "apricot", "fish"])
        print(prefixGenerator.log())
    }

}
```