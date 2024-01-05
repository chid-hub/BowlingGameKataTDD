//
//  ViewController.swift
//  BowlingGameKataTDD
//
//  Created by LoaclUser on 05/01/24.
//

import UIKit

class BowlingGameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel: BowlingGameViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the view model with the model
        let model = BowlingGameModel()
        viewModel = BowlingGameViewModel(bowlingGameModel: model)
    }
    
    @IBAction func numberOfPinKnokedButtonTapped(_ sender: UIButton) {
        let pinsKnockedDown = sender.tag
        viewModel.roll(pins: pinsKnockedDown)
        updateScore()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        viewModel.resetGame()
        scoreLabel.text = "Total score: 0"
        collectionView.reloadData()
    }
    private func updateScore() {
        var scoreByFrames = ""
        for frame in viewModel.getAllFrames() {
            scoreByFrames += " \(frame.score()) "
        }
        
        scoreLabel.text = "Total score: \(viewModel.score())"
        collectionView.reloadData()
    }
    
}

