//
//  BowlingGameKataTDDTests.swift
//  BowlingGameKataTDDTests
//
//  Created by LoaclUser on 05/01/24.
//

import XCTest
@testable import BowlingGameKataTDD

final class BowlingGameKataTDDTests: XCTestCase {

    var game: BowlingGameViewModel!
    override func setUp() {
        super.setUp()
        let model = BowlingGameModel()
        game = BowlingGameViewModel(bowlingGameModel: model)
    }
    
    func testRollingOneStrike() {
        game.roll(pins: 10)  // Strike
        game.roll(pins: 5)
        game.roll(pins: 5)
        XCTAssertEqual(game.score(), 20)
    }
    
    func testOpenFramesScore() {
        game.roll(pins: 3)
        game.roll(pins: 5)

        XCTAssertEqual(game.score(), 8)
    }
    
    func testAllStrikes() {
         for _ in 0..<12 {
             game.roll(pins:10)
         }
         XCTAssertEqual(game.score(), 300)
     }
    // Test case: all spares
    func testAllSpares() {
        for _ in 0...10 {
            game.roll(pins:5)
            game.roll(pins:5)
        }
        XCTAssertEqual(game.score(), 150)
    }
    // Test case: all miss
    func testAllMisses() {
        for _ in 0...10 {
            game.roll(pins:0)
            game.roll(pins:0)
        }
        XCTAssertEqual(game.score(), 0)
    }
    // Test case: 10 pairs of 9 and miss
    func testPairsOfNineAndMisses() {
        for _ in 1...10 {
            game.roll(pins:9)
            game.roll(pins:0)
        }
        XCTAssertEqual(game.score(), 90)
    }
    // Test case: 10 pairs of 5 and spare, with a final 5
    func testPairsOfFiveAndSpareWithFinalFive() {
        for _ in 1...10 {
            game.roll(pins:5)
            game.roll(pins:5)
        }
        game.roll(pins:5)
        XCTAssertEqual(game.score(), 150)
    }
    
}
