//
//  ChallengeTableViewCell.swift
//  Challenge
//
//  Created by Anton Korshikov on 27.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit


struct ImageRow {
    var Title: String;
    var Imager: UIImage;
    var Likes: UInt;
}


class ChallengeTableViewCell: UITableViewCell {
    
    var CurrentImage:ImageRow?;
    

    @IBOutlet var LikeButton: UIButton!
    @IBOutlet weak var Imager: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Imager.contentMode = .ScaleAspectFit;

    }
    
    @IBAction func PressedLike() {
        if (LikeButton.titleLabel!.enabled) {
            ++CurrentImage!.Likes;
            LikeButton.titleLabel?.enabled = false;
        } else {
            --CurrentImage!.Likes;
            LikeButton.titleLabel?.enabled = true;
        }
        
        SetRowData();
        
    }
    
    func SetRowData() {
        
        Subtitle.text = "Likes: \(CurrentImage!.Likes)";
        Title.text = CurrentImage!.Title;
        Imager.image = CurrentImage!.Imager;
    }
    
    /*
    override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    }*/
    
}
