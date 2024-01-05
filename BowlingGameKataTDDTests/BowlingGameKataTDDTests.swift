//
//  BowlingGameKataTDDTests.swift
//  BowlingGameKataTDDTests
//
//  Created by LoaclUser on 05/01/24.
//

import XCTest
@testable import BowlingGameKataTDD

final class BowlingGameKataTDDTests: XCTestCase {

    var bowlingGame: BowlingGameViewModel!
    override func setUp() {
        super.setUp()
        let model = BowlingGameModel()
        bowlingGame = BowlingGameViewModel(bowlingGameModel: model)
    }
    
    func testRollingOneBall() {
         let game = BowlingGameModel()
         game.roll(pins: 5)
         XCTAssertEqual(game.score(), 5)
     }
    
    func testRollingOneSpare() {
        let game = BowlingGameModel()
        game.roll(pins: 5)
        game.roll(pins: 5)  // Spare
        XCTAssertEqual(game.score(), 10)
    }
}
