## Description

This problem was asked by Amazon.

The stable marriage problem is defined as follows:

Suppose you have `N` men and `N` women, and each person has ranked their prospective opposite-sex partners in order of preference.

For example, if `N = 3`, the input could be something like this:

```
guy_preferences = {
    'andrew': ['caroline', 'abigail', 'betty'],
    'bill': ['caroline', 'betty', 'abigail'],
    'chester': ['betty', 'caroline', 'abigail'],
}

gal_preferences = {
    'abigail': ['andrew', 'bill', 'chester'],
    'betty': ['bill', 'andrew', 'chester'],
    'caroline': ['bill', 'chester', 'andrew']
}
```

Write an algorithm that pairs the men and women together in such a way that no two people of opposite sex would both rather be with each other than with their current partners.

## Solution

```swift
struct Population {
    
    typealias Couple = (guy: String, gal: String)
    
    var guyPrefs: [String: [String]]
    var galPrefs: [String: [String]]
    
    func marry() -> [(String, String)] {
        
        var couples: [Couple] = []
        
        
        for guy in guyPrefs {
            
            let entry = (guy.key, guy.value.first!)
            couples.append(entry)
        }
        
        // This could eventually circle based on the initial population. It also needs to be improved so that we try every possibilities in the combinations rather than just the first one.
        while !areValidCouples(couples: couples) {
            
            guard let combination = indexesOfCommonGal(couples: couples).first else {
                fatalError("Can't help this population!")
            }
            
            let gal = couples[combination.0].gal
            let galOption1 = couples[combination.0].guy
            let galOption2 = couples[combination.1].guy
            
            var preferOption1 = false
            
            for galPref in galPrefs {
                
                if galPref.key == gal {
                    
                    for pref in galPref.value {
                        if pref == galOption1 {
                            preferOption1 = true
                            break
                        }
                        
                        if pref == galOption2 {
                            preferOption1 = false
                            break
                        }
                    }
                }
            }
            
            let toRotate = preferOption1 ? galOption2 : galOption1
            
            for i in 0..<couples.count {
                let couple = couples[i]
                
                if couple.guy == toRotate {
                    
                    for guyPref in guyPrefs {
                        if guyPref.key == couple.guy {
                            var chooseNext = false
                            
                            for pref in guyPref.value {
                                if pref == gal {
                                    chooseNext = true
                                }
                                
                                if chooseNext {
                                    couples[i].gal = pref
                                }
                            }
                        }
                    }
                }
            }
            
        }
        
        return couples
    }
    
    private func areValidCouples(couples: [Couple]) -> Bool {
        
        let size = couples.count
        
        let mappedGuys = Set(couples.map({ $0.guy }))
        let mappedGals = Set(couples.map({ $0.gal }))
        
        return mappedGuys.count == size && mappedGals.count == size
    }
    
    private func indexesOfCommonGal(couples: [Couple]) -> [(Int, Int)] {
        var indexes: [(Int, Int)] = []
        
        for i in 0..<couples.count-1 {
            
            for j in i+1..<couples.count {
                
                if couples[j].gal == couples[i].gal {
                    indexes.append((i, j))
                }
            }
        }
        
        return indexes
    }
}
```

## Tests

```swift
class Problem_329Tests: XCTestCase {

    func test_example() {
        
        let population = Population(guyPrefs: [
            "andrew": ["caroline", "abigail", "betty"],
            "bill": ["caroline", "betty", "abigail"],
            "chester": ["betty", "caroline", "abigail"]
        ], galPrefs: [
            "abigail": ["andrew", "bill", "chester"],
            "betty": ["bill", "andrew", "chester"],
            "caroline": ["bill", "chester", "andrew"]
        ])
        
        print(population.marry())
    }

}
```