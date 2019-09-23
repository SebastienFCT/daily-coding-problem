## Description

This problem was asked by Microsoft.

Implement the singleton pattern with a twist. First, instead of storing one instance, store two instances. And in every even call of `getInstance()`, return the first instance and in every odd call of `getInstance()`, return the second instance.

## Solution

```swift
class Singleton {
    static private let instance1 = Singleton()
    static private let instance2 = Singleton()
    private var even = true
    
    static func getInstance() -> Singleton {
        if Singleton.instance1.even {
            Singleton.instance1.even = false
            Singleton.instance2.even = true
            print("returned instance1")
            return Singleton.instance1
        } else {
            Singleton.instance1.even = true
            Singleton.instance2.even = false
            print("returned instance2")
            return Singleton.instance2
        }
    }
}
```

## Test

```swift
class Problem_120Tests: XCTestCase {

    func test_twist_singleton() {
        _ = Singleton.getInstance()
        _ = Singleton.getInstance()
        _ = Singleton.getInstance()
        _ = Singleton.getInstance()
        _ = Singleton.getInstance()
    }

}
```