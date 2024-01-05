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
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "FrameCell", bundle: nil), forCellWithReuseIdentifier: FrameCell.reuseIdentifier)
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

extension BowlingGameViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getAllFrames().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FrameCell.reuseIdentifier, for: indexPath) as? FrameCell else {
            fatalError("Unable to dequeue FrameCell")
        }

        let frame = viewModel.getAllFrames()[indexPath.item]
        cell.configure(frame: frame, index: indexPath.row)

        return cell
    }
}

extension BowlingGameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.width / CGFloat(10)
            return CGSize(width: width, height: collectionView.frame.height/2)
        }
}
