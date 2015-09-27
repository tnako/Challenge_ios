//
//  ChallengeDetailViewController.swift
//  Challenge
//
//  Created by Anton Korshikov on 26.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit

/* detail scene view controller
displays its item (the selected master list row) */
class ChallengeDetailViewController: UITableViewController {
    // model to display
    var item: String = "sdf"
    
    
    //@IBOutlet weak var Subtitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // display the item
      //  self.Subtitle!.text = self.item
    }
}

