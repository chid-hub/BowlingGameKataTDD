//
//  BowlingGameModel.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import Foundation

class BowlingGameModel {
    
    var rolls: [Int] = []
    var frames: [Frame] = []
    
    func roll(pins: Int) {
        rolls.append(pins)
        updateFrames()
    }
    
    func score() -> Int {
        return frames.reduce(0) { $0 + $1.score() }
    }
    
    func updateFrames(){
        var frameIndex = 0
        frames = []
        
        for _ in 0..<10 {
            guard frameIndex < rolls.count else { break} // Stop processing frames if there are not enough rolls
            if isStrike(frameIndex) {
                frames.append(StrikeFrameModel(rolls: rolls, staringIndex: frameIndex))
                frameIndex += 1
                continue
            }
            guard frameIndex + 1 < rolls.count else { break } // Stop processing frames if there are not enough rolls
            if isSpare(frameIndex) {
                frames.append(SpareFrameModel(rolls: rolls, staringIndex: frameIndex))
            } else {
                frames.append(OpenFrameModel(rolls: rolls, staringIndex: frameIndex))
            }
            frameIndex += 2
        }
    }
    
    private func isSpare(_ frameIndex: Int) -> Bool {
        guard frameIndex + 1 < rolls.count else { return  false} // Stop processing frames if there are not enough rolls
        return rolls[frameIndex] + rolls[frameIndex + 1] == 10
    }
    
    private func isStrike(_ frameIndex: Int) -> Bool {
        return rolls[frameIndex] == 10
    }
    
    func resetGame() {
        rolls = []
        updateFrames()
    }
    
    func getAllFrames() -> [Frame] {
        return frames
    }
}
