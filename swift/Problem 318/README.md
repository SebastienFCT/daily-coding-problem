## Description

This problem was asked by Apple.

You are going on a road trip, and would like to create a suitable music playlist. The trip will require N songs, though you only have M songs downloaded, where `M` < `N`. A valid playlist should select each song at least once, and guarantee a buffer of `B` songs between repeats.

Given `N`, `M`, and `B`, determine the number of valid playlists.

## Solution

```swift
struct Trip {
    
    func countValidPlaylists(requiredSongs: Int, actualSongs: Int, buffer: Int) -> Int {
        
        if buffer > actualSongs {
            fatalError("not enough songs")
        }
        
        if requiredSongs == 0 {
            return 1
        }
        
        let nextRequired = requiredSongs-1
        let remainingSounds = buffer == 0 ? actualSongs : actualSongs-1
        let nextBuffer = buffer > 0 ? buffer-1 : buffer
        
        return actualSongs * countValidPlaylists(requiredSongs: nextRequired, actualSongs: remainingSounds, buffer: nextBuffer)
    }
}
```

## Tests

```swift
class Problem_318Tests: XCTestCase {

    func test_count_valid_playlists() {
        
        
        let input = Trip()
        
        // required: 3
        // available: S1 S2
        // buffer: 1
        // candidates: [S1, S2, S1], [S2, S1, S2]
        
        let actual = input.countValidPlaylists(requiredSongs: 3, actualSongs: 2, buffer: 1)
        let expected = 2
        
        XCTAssert(actual == expected)
        
        // required: 4
        // available: S1 S2
        // buffer: 1
        // candidates: [S1, S2, S1, S2], [S2, S1, S2, S1]
        
        let actual2 = input.countValidPlaylists(requiredSongs: 4, actualSongs: 2, buffer: 1)
        let expected2 = 2
        
        XCTAssert(actual2 == expected2)
    }

}
```