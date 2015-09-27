//
//  FirstViewController.swift
//  Challenge
//
//  Created by Anton Korshikov on 25.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit

class ChallengesController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var ChallengesTable: UITableView!
    
    let textCellIdentifier = "OneRow"
    
    var ChallengesArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...122 {
            ChallengesArray.append("Quest #\(index)")
        }
        
        ChallengesTable.delegate = self
        ChallengesTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChallengesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ChallengesTable.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! ChallengesTableViewCell
        
        let row = indexPath.row
        cell.HeaderLabel?.text = ChallengesArray[row]
        
        let minutes = arc4random_uniform(98) + 1;
        
        if (minutes > 70) {
            cell.selected = true;
        } else {
            cell.TimerLabel.text = "Ends in \(minutes) minute";
            cell.ProgressBar.progress = 1 - Float(minutes) / 100.0;
        }
        
        return cell
    }

}

