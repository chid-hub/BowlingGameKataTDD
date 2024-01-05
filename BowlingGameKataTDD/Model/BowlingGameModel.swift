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
            
            if isStrike(frameIndex) {
                total += StrikeFrameModel(rolls: rolls, staringIndex: frameIndex).score()
                frameIndex += 1
            } else if isSpare(frameIndex) {
                total += SpareFrameModel(rolls: rolls, staringIndex: frameIndex).score()
                frameIndex += 2
            } else {
                total += OpenFrameModel(rolls: rolls, staringIndex: frameIndex).score()
                frameIndex += 2
            }
            
        }
        
        return total
    }
    
    private func isSpare(_ frameIndex: Int) -> Bool {
        guard frameIndex + 1 < rolls.count else { return  false} // Stop processing frames if there are not enough rolls
        return rolls[frameIndex] + rolls[frameIndex + 1] == 10
    }

    private func isStrike(_ frameIndex: Int) -> Bool {
        return rolls[frameIndex] == 10
    }
    
}
