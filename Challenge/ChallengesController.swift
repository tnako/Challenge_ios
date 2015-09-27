//
//  FirstViewController.swift
//  Challenge
//
//  Created by Anton Korshikov on 25.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit


// ToDo: разобраться с датой, учитывая часовой пояс

struct Challenge {
    var num: UInt?;
    var start: timeb?;
    var end: timeb;
    var action: String;
    var item: String?;
    var place: String?;
    var person: String?;
    
    init(num: UInt?, start: timeb?, end: timeb,
        action: String, item: String?, place: String?, person: String?) {
            self.num = num;
            self.start = start;
            self.end = end;
            self.action = action;
            self.item = item;
            self.place = place;
            self.person = person;
    }
}


class ChallengesController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var ChallengesTable: UITableView!
    
    var ChallengesArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 1...62 {
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
        let cell = ChallengesTable.dequeueReusableCellWithIdentifier("OneRow", forIndexPath: indexPath) as! ChallengesTableViewCell
        
        let row = indexPath.row
        cell.HeaderLabel?.text = ChallengesArray[row]
        
        let minutes = arc4random_uniform(98) + 1;
        
        if (minutes > 70) {
            cell.backgroundColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1);
            cell.TimerLabel.text = "Start in \(minutes) minute";
            cell.ProgressBar.progress = Float(minutes) / 100.0;
        } else {
            cell.TimerLabel.text = "Ends in \(minutes) minute";
            cell.ProgressBar.progress = 1 - Float(minutes) / 100.0;
        }
        
        return cell
    }

}

