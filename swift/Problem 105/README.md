## Description

This problem was asked by Facebook.

Given a function `f`, and `N` return a debounced `f` of `N` milliseconds.

That is, as long as the debounced `f` continues to be invoked, `f` itself will not be called for `N` milliseconds.

## Solution

```swift
class Debouncer {
    var workItem: DispatchWorkItem?
    
    init(workItem: DispatchWorkItem?) {
        self.workItem = workItem
    }
    
    func debounce(delay: DispatchTimeInterval, queue: DispatchQueue = .main) {
        workItem?.cancel()
        workItem = DispatchWorkItem { print("I ran from debouncer at \(Date())") }
        queue.asyncAfter(deadline: .now() + delay, execute: workItem!)
    }
}
```

## Test

```swift
class Problem_105Tests: XCTestCase {
    
    func test_debounce() {
        let debouncer = Debouncer(workItem: nil)
        
        for _ in 0...2 {
            print("I ran out of debouncer at \(Date())")
            debouncer.debounce(delay: .seconds(1), queue: .global(qos: .background))
            Thread.sleep(forTimeInterval: 1)
        }
    }

}
```