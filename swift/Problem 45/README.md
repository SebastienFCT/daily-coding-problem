## Description

This problem was asked by Two Sigma.

Using a function `rand5()` that returns an integer from `1` to `5` (inclusive) with uniform probability, implement a function `rand7()` that returns an integer from `1` to `7` (inclusive).

## Solution

```swift
struct SigmaChallenge {
    
    static func rand5() -> Int {
        return Int.random(in: 1...5)
    }
    
    static func rand7() -> Int {
        return (rand5() + rand5() + rand5() + rand5() + rand5() + rand5() + rand5()) / 7
    }
}

extension SigmaChallenge {
    static func rand7b() -> Int {
        
        let random = (SigmaChallenge.rand5() * 5) - 5 + SigmaChallenge.rand5()
        
        if random >= 22 {
            return SigmaChallenge.rand7b()
        }
        
        switch random {
        case 1..<4:
            return 1
        case 4..<7:
            return 2
        case 7..<10:
            return 3
        case 10..<13:
            return 4
        case 13..<16:
            return 5
        case 16..<19:
            return 6
        default:
            return 7
        }
    }
}
```

## Test

```swift
class Problem_45Tests: XCTestCase {

    func test_0() {
        let total: Double = 100000
        
        var count1: Double = 0
        var count2: Double = 0
        var count3: Double = 0
        var count4: Double = 0
        var count5: Double = 0
        
        for _ in 0...Int(total) {
            switch SigmaChallenge.rand5() {
            case 1:
                count1 += 1
            case 2:
                count2 += 1
            case 3:
                count3 += 1
            case 4:
                count4 += 1
            default:
                count5 += 1
            }
        }
        
        print("repartition: 1(\(count1/total)),2(\(count2/total)),3(\(count3/total)),4(\(count4/total)),5(\(count5/total))")
    }
    
    func test_1() {
        let total: Double = 100000
        
        var count1: Double = 0
        var count2: Double = 0
        var count3: Double = 0
        var count4: Double = 0
        var count5: Double = 0
        var count6: Double = 0
        var count7: Double = 0
        
        for _ in 0...Int(total) {
            switch SigmaChallenge.rand7b() {
            case 1:
                count1 += 1
            case 2:
                count2 += 1
            case 3:
                count3 += 1
            case 4:
                count4 += 1
            case 5:
                count5 += 1
            case 6:
                count6 += 1
            default:
                count7 += 1
            }
        }
        
        print("repartition: 1(\(count1/total)),2(\(count2/total)),3(\(count3/total)),4(\(count4/total)),5(\(count5/total)),6(\(count6/total)),7(\(count7/total))")
    }

}
```