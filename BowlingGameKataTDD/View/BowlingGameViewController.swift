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
       
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
    }
    
}

