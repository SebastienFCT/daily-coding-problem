## Description

This problem was asked by Uber.

On election day, a voting machine writes data in the form (`voter_id`, `candidate_id`) to a text file. Write a program that reads this file as a stream and returns the top `3` candidates at any given time. If you find a voter voting more than once, report this as fraud.

## Solution

```swift
struct VotingMachine {
    
    var voters: Set<UUID>
    var candidates: [UUID: Int]
    var top3: [(id: UUID, count: Int)]
    var min: Int
    
    mutating func vote(voterId: UUID, candidateId: UUID) {
        
        if voters.contains(voterId) {
            fatalError("voter with id \(voterId) is frauding")
        }
        
        voters.insert(voterId)
        
        if candidates.keys.contains(candidateId) {
            candidates[candidateId]! += 1
        } else {
            candidates[candidateId] = 1
        }
        
        if candidates[candidateId]! > min {
            
            if top3.contains(where: { (candidate) -> Bool in
                candidate.id == candidateId
            }) {
                top3.removeAll { (candidate) -> Bool in
                    candidate.id == candidateId
                }
                
                top3.append((candidateId, candidates[candidateId]!))
                top3.sort{ $0.count > $1.count }
                return
            }
            
            if top3.count < 3 {
                top3.append((candidateId, candidates[candidateId]!))
                return
            }
            
            top3.removeLast()
            top3.append((candidateId, candidates[candidateId]!))
            
            min = candidates[candidateId]!
        }
    }
}
```

## Tests

```swift
class Problem_300Tests: XCTestCase {

    func test_voting_machine() {
        
        let sarkozy = UUID()
        let lepen = UUID()
        let melenchon = UUID()
        let bayrou = UUID()
        
        let map = [
            sarkozy: "sarkozy",
            lepen: "lepen",
            melenchon: "melenchon",
            bayrou: "bayrou"
        ]
        
        var vm = VotingMachine(voters: Set(), candidates: [:], top3: [], min: 0)
        
        for _ in 0...1000 {
            
            switch Int.random(in: 0...3) {
                case 0: vm.vote(voterId: UUID(), candidateId: sarkozy)
                case 1: vm.vote(voterId: UUID(), candidateId: lepen)
                case 2: vm.vote(voterId: UUID(), candidateId: melenchon)
                case 3: vm.vote(voterId: UUID(), candidateId: bayrou)
                default: break
            }
            print(vm.top3.map{ (map[$0.id]!,$0.count) })
        }
    }

}
```