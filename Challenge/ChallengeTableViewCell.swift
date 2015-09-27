//
//  ChallengeTableViewCell.swift
//  Challenge
//
//  Created by Anton Korshikov on 27.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit

class ChallengeTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var Imager: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    /*
    override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    }*/
    
}
