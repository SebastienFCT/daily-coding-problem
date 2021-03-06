## Description

This problem was asked by Google.

PageRank is an algorithm used by Google to rank the importance of different websites. While there have been changes over the years, the central idea is to assign each site a score based on the importance of other pages that link to that page.

More mathematically, suppose there are `N` sites, and each site `i` has a certain count `Ci` of outgoing links. Then the score for a particular site `Sj` is defined as :

`score(Sj) = (1 - d) / N + d * (score(Sx) / Cx+ score(Sy) / Cy+ ... + score(Sz) / Cz))`

Here, `Sx`, `Sy`, ..., `Sz` denote the scores of all the other sites that have outgoing links to `Sj`, and `d` is a `damping factor`, usually set to around 0.85, used to model the probability that a user will stop searching.

Given a directed graph of links between various websites, write a program that calculates each site's page rank.

## Solution

```swift
class Node {
    var value: String
    var pointers: [Node]
    
    init(value: String, pointers: [Node]) {
        self.value = value
        self.pointers = pointers
    }
    
    init(value: String) {
        self.value = value
        self.pointers = []
    }
}

struct PageInfo {
    var value: String
    var referenceCount: Int
    var referencingCount: Int
}

struct Web {
    
    var pages: [Node]
    var dampingFactor: Float
    
    private func pageInfos() -> [PageInfo] {
        
        var result: [String : PageInfo] = [:]
        
        for page in pages {
            
            if !result.keys.contains(page.value) {
                result[page.value] = PageInfo(value: page.value, referenceCount: 0, referencingCount: page.pointers.count)
            } else {
                result[page.value]!.referencingCount = page.pointers.count
            }
            
            for link in page.pointers {
                if !result.keys.contains(link.value) {
                    result[link.value] = PageInfo(value: link.value, referenceCount: 1, referencingCount: 0)
                } else {
                    result[link.value]!.referenceCount += 1
                }
            }
        }
        
        return result.map({ $0.value })
    }
    
    func ranking() -> [String: Float] {
        
        var result: [String: Float] = [:]
        let infos = pageInfos()
        
        for info in infos {
            let referenceFactor = (1.0 - dampingFactor) / Float(info.referencingCount)
            let othersFactor = dampingFactor * Float(info.referenceCount)
            
            result[info.value] = referenceFactor + othersFactor
        }
        
        return result
    }
}

```

## Tests

```swift
class Problem_335Tests: XCTestCase {

    func test_page_ranking() {
        
        let web1 = Node(value: "web1")
        let web2 = Node(value: "web2")
        let web3 = Node(value: "web3")
        let web4 = Node(value: "web4")
        
        web1.pointers = [web2, web3]
        web3.pointers = [web2]
        web2.pointers = [web4]
        
        let input = Web(pages: [web1, web2, web3], dampingFactor: 0.85)
        
        print(input.ranking())
    }

}
```