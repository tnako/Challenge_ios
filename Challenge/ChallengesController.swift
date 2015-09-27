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
    var action: String?;
    var start: timeb?;
    var end: timeb?;
    var item: String?;
    var place: String?;
    var person: String?;
    
    init(num: UInt?, action: String?,
        start: timeb?, end: timeb?,
        item: String?, place: String?, person: String?) {
            self.num = num;
            self.action = action;
            self.start = start;
            self.end = end;
            self.item = item;
            self.place = place;
            self.person = person;
    }
}


class ChallengesController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var ChallengesTable: UITableView!;
    
    var ChallengesArray = [Challenge]()
    //var SelectedRow:Int?;

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index:UInt in 1...62 {
            var endDate:timeb = timeb();
            endDate.time  = time_t(arc4random_uniform(98) + 1);
            ChallengesArray.append(Challenge(num: index, action: "drink", start: timeb(), end: endDate, item: "", place: "", person: ""));
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
        cell.HeaderLabel?.text = "Quest #\(ChallengesArray[row].num!)";
        
        let minutes:UInt = UInt(ChallengesArray[row].end!.time);
      
        if (minutes > 90 || minutes < 10) {
            // проголосовал сам или учавствовал
            cell.accessoryType = .Checkmark;
        } else {
            cell.accessoryType = .DisclosureIndicator;
        }
        
        if (minutes > 70) {
            cell.backgroundColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1);
            cell.TimerLabel.text = "Start in \(minutes) minute";
            cell.ProgressBar.progress = Float(minutes) / 100.0;

        } else {
            cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1);
            cell.TimerLabel.text = "Ends in \(minutes) minute";
            cell.ProgressBar.progress = 1 - Float(minutes) / 100.0;
        }
        
        return cell
    }
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        ChallengesTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        SelectedRow = indexPath.row;
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowChallenge" {
            print("ShowChallenge debug");
            if let indexPath = self.ChallengesTable.indexPathForSelectedRow {
                let challenge = ChallengesArray[indexPath.row];
                let controller = segue.destinationViewController as! ChallengeDetailViewController;
                //controller.PhotoArray.append("Quest #\(challenge.num!)");
                //ToDo: передача номера квеста
            }
        }

    }

}

