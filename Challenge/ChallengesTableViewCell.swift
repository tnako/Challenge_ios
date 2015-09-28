//
//  ChallengesTableViewCell.swift
//  Challenge
//
//  Created by Anton Korshikov on 25.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit

class ChallengesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var HeaderLabel: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var TimerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    /*
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }*/
    
}
