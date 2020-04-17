//
//  Solution.swift
//  Problem 328
//
//  Created by sebastien FOCK CHOW THO on 2020-04-17.
//  Copyright © 2020 sebastien FOCK CHOW THO. All rights reserved.
//

import Foundation

typealias PlayerElo = (player: String, elo: Int)
struct Elo {

    var players: [PlayerElo]
    var minRank: Int
    
    mutating func addPlayer(username: String) -> PlayerElo? {
        
        if players.contains(where: { (playerElo) -> Bool in
            playerElo.player == username
        }) {
            print("username already taken")
            return nil
        }
        
        let newPlayerElo = (username, minRank)
        players.append(newPlayerElo)
        
        return newPlayerElo
    }
    
    mutating func simulateWin(fromUserAtIndex winnerIndex: Int, againstUserAtIndex looserIndex: Int) {
        
        guard winnerIndex < players.count && looserIndex < players.count else {
            fatalError("index out of bounds")
        }
        
        var difference = abs(players[winnerIndex].elo - players[looserIndex].elo)
        
        if players[winnerIndex].elo > players[looserIndex].elo {
            // winner was higher rank
            difference = minRank/10 - difference
            difference = max(difference, minRank/10)
        } else if players[winnerIndex].elo < players[looserIndex].elo {
            // winner was lower rank
            difference = minRank/10 + difference
        } else {
            // same score
            difference = minRank/10
        }
        
        players[winnerIndex].elo += difference
        players[looserIndex].elo -= difference
        
        print("\(players[winnerIndex].player) beats \(players[looserIndex].player)")
        
        players[looserIndex].elo = players[looserIndex].elo < minRank ? minRank : players[looserIndex].elo
    }
    
    func score() -> String {
        
        var score = ""
        
        for player in players {
            score += "\(player.player): \(player.elo) \n"
        }
        
        score += "===="
        
        return score
    }
    
}
