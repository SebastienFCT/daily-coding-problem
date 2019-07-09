## Description

This problem was asked by Two Sigma.

Using a function `rand5()` that returns an integer from `1` to `5` (inclusive) with uniform probability, implement a function `rand7()` that returns an integer from `1` to `7` (inclusive).

## Solution

Ok this might not be the best solution, but that comes immediately into mind after reading the exercise.
 
If ran5() gives me a random value between 1 & 5 inclusive, then I can run rand5() X times and divide the result by X to produce randX()

1+1+2+2+3+5+5 / 7

The biggest problem with this is that we will most likely get a decimal value.

It can be solve for almost any case if we truncate the value:

- [1-1.99] = 1
- [2-2.99] = 2
- ...
- [6-6.99] = 6
- [7] = 7

The problem here is that the chances to have a 7 is 100 times (?) smaller than any other values (or at least smaller)

What if I run it X+1 times?

- [1-1.99] = 1
- ...
- [7-7.99] = 7
- 8 = ?

While it's not really efficient, what I would do here is that I would just re-run the function if I get an 8.

Let's write this:

```swift
struct SigmaChallenge {
    
    static func rand5() -> Int {
        return Int.random(in: 1...5)
    }
    
    static func rand7() -> Int {
        return (rand5() + rand5() + rand5() + rand5() + rand5() + rand5() + rand5()) / 7
    }
}
```

After testing, I wasn't able to get at least a 4...
 
I didn't troubleshoot as I also realize that all my thoughts earliers weren't correct:

There is actually more possible combinations to get a 3 that there is to get a 7

The only change to have 7 is to draw 7 times 7, for 3 its any combination that give 7 * 3 = 21

Let's get back to the roots.

- If I draw rand5() twice, I can get any value between 2...10 (9 possibilities)
- If I draw rand5() 3 times, I can get any value between 3...15 (13 possibilities)
- If I draw rand5() 4 times, I can get any value between 4...20 (17 possibilities)
- If I draw rand5() 5 times, I can get any value between 5...25 (21 possibilities)

The problem here is that I get a random value between N...M where N > 1, I want N to be equal to 1, I can substract 4, this would give me a change to have any value between 1 and 21. But then, we're back to the initial problem where the chance to have 1 is smaller than the chances to have 2 (1 has only one possibility, drawing 1 all the time, 2 has multiple possibilities by swapping 2s with 1s and 3s).

If I draw rand5, multiply by 5 and substract 4, I have equal chances to draw 1, 6, 11, 16, 21, but I want equal chances to get any values in between as well, so I can add to this a rand5(), this will give me equal chances to have 1+(1-5), 6+(1-5), 11+(1-5), 16+(1-5), 21+(1-5), or equal chances to have any values between 1 and 26

What we can do is that since 21 is a multiple of 7, we could just ignore values > 21 and re-run the function until we get a value between 1 and 21, this might not be the most efficient method however we will always have equal value to draw anything between 1 and 21 at any iteration.

Finally, we just have to divide the result by 3 and truncate (just like we we doing in the first attempt)

```swift
extension SigmaChallenge {
    static func rand7b() -> Int {
        // random value between 1 and 26
        let random = (SigmaChallenge.rand5() * 5) - 4 + SigmaChallenge.rand5()

        // Make sure to ignore the case 22, but not any value >21 && <22
        if random >= 22 {
            return SigmaChallenge.rand7b()
        }

        return random / 3
    }
}
```

Now we need to test this, we can simply run it X times and calculate the probability of each (the greater is X and the closer to 1/7 we should get)
 
After the tests, this doesn't seem correct...

I realized a mistake earlier, I have random values between 2 and 26, not 1 and 26. So instead of subtracting 4, I will substract 5 which will give me a random value between 0 and 25 and I will just have to swap my values (0 means 1, 1 means 2, ..., 20 means 21)

I also found that rand5() wasn't uniform. I updated the function and added a test for it

```swift
extension SigmaChallenge {
    static func rand7b() -> Int {
        // random value between 1 and 26
        let random = (SigmaChallenge.rand5() * 5) - 5 + SigmaChallenge.rand5()
        
        // Make sure to ignore the case 22, but not any value >21 && <22
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