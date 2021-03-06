## Description

This problem was asked by Microsoft.

Given a clock time in `hh:mm` format, determine, to the nearest degree, the angle between the hour and the minute hands.

Bonus: When, during the course of a day, will the angle be zero?

## Solution

```swift
struct Clock {
    
    var hoursDigits: Int
    var minutesDigits: Int
    
    init(time: String) {
        
        let splitted = time.split(separator: ":")
        
        guard splitted.count == 2 else {
            fatalError("format must be hh:mm")
        }
        
        let hours = splitted[0]
        let minutes = splitted[1]
        
        guard let hoursVal = Int(hours), let minuteVal = Int(minutes) else {
            fatalError("format must be hh:mm")
        }
        
        self.hoursDigits = hoursVal
        self.minutesDigits = minuteVal
    }
    
    func angle() -> Int {
        
        let hourAngle = (hoursDigits % 12) * (360/12)
        let minuteAngle = (minutesDigits % 60) * (360/60)
        
        return abs(hourAngle-minuteAngle)
    }
    
    static func zeroAngles() -> [String] {
        var result: [String] = []
        
        for i in 0...23 {
            
            for j in 0...59 {
                
                let hourAngle = (i % 12) * (360/12)
                let minuteAngle = (j % 60) * (360/60)
                
                if abs(hourAngle-minuteAngle) == 0 {
                    let iVal = i < 10 ? "0\(i)" : "\(i)"
                    let jVal = j < 10 ? "0\(j)" : "\(j)"
                    result.append("\(iVal):\(jVal)")
                }
            }
        }
        
        return result
    }
}
```

## Tests

```swift
class Problem_303Tests: XCTestCase {

    func test_example() {
        
        let input = Clock(time: "12:12")
        
        print(input.angle())
        print(Clock.zeroAngles())
    }

}
```