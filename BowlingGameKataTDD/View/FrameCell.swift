//
//  FrameCell.swift
//  BowlingGameKATA
//
//  Created by  on 15/12/23.
//

import UIKit

class FrameCell: UICollectionViewCell {
    
    static let reuseIdentifier = "FrameCell"
    @IBOutlet weak var frameNumberLabel: UILabel!
    @IBOutlet weak var firstThrowScoreLabel: UILabel!
    @IBOutlet weak var secondThrowScoreLabel: UILabel!
    @IBOutlet weak var thirdThrowScoreLabel: UILabel!
    
    func configure(frame: any Frame, index: Int) {
        frameNumberLabel.text = "\(index + 1)"
        secondThrowScoreLabel.text = ""
        thirdThrowScoreLabel.isHidden = true
        
        if let openFrame = frame as? OpenFrameModel {
            // Handle OpenFrame
            firstThrowScoreLabel.text = "\(openFrame.currentRollingScore())"
            secondThrowScoreLabel.text = "\(openFrame.nextRollingScore())"
        } else if let spareFrame = frame as? SpareFrameModel {
            // Handle SpareFrame
            firstThrowScoreLabel.text = "\(spareFrame.currentRollingScore())"
            secondThrowScoreLabel.text = "/"
            if index == 9 {
                thirdThrowScoreLabel.text = "\(spareFrame.firstBonusBall())"
                thirdThrowScoreLabel.isHidden = false
            }
        }else if let strikeframe = frame as? StrikeFrameModel{
            // Handle StrikeFrame
            firstThrowScoreLabel.text = "X"
            if index == 9 {
                secondThrowScoreLabel.text = "\(strikeframe.firstBonusBall())"
                thirdThrowScoreLabel.text = "\(strikeframe.secondBonusBall())"
                thirdThrowScoreLabel.isHidden = false
            }
        }
    }
}
