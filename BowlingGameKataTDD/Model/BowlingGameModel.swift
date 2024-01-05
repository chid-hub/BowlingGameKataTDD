//
//  BowlingGameModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

class BowlingGameModel {
    
    var rolls: [Int] = []
    
    func roll(pins: Int) {
        rolls.append(pins)
    }
    
    func score() -> Int {
        var total = 0
        var frameIndex = 0
        
        for _ in 0..<10 {
            
            guard frameIndex < rolls.count else { break} // Stop processing frames if there are not enough rolls
            
            if isSpare(frameIndex) {
                total += 10 + spareBonus(frameIndex)
                frameIndex += 2
            } else {
                total += rolls[frameIndex]
                frameIndex += 1
            }
        }
        
        return total
    }
    
    private func isSpare(_ frameIndex: Int) -> Bool {
        guard frameIndex + 1 < rolls.count else { return  false} // Stop processing frames if there are not enough rolls
        return rolls[frameIndex] + rolls[frameIndex + 1] == 10
    }
    
    private func spareBonus(_ frameIndex: Int) -> Int {
        guard frameIndex + 2 < rolls.count else { return 0 } // Stop processing frames if there are not enough rolls

        return rolls[frameIndex + 2]
    }
}
