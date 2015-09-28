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


    @IBOutlet var PhotoTable: UITableView!
    var PhotoArray = [ImageRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotoArray.append(ImageRow(Title: "Lorem", Imager: UIImage(named: "camaro_512")!, Likes: UInt(arc4random_uniform(980))));
        PhotoArray.append(ImageRow(Title: "Blah", Imager: UIImage(named: "camaro_512")!, Likes: UInt(arc4random_uniform(980))));
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhotoArray.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = PhotoTable.dequeueReusableCellWithIdentifier("PhotoRow", forIndexPath: indexPath) as! ChallengeTableViewCell
        
        let row = indexPath.row;
        cell.CurrentImage = PhotoArray[row];
        cell.SetRowData();
        
        return cell
    }
    
    @IBAction func saveNewPhoto(segue:UIStoryboardSegue) {
        
        if let controller = segue.sourceViewController as? TakePhotoController {
            
            //PhotoArray.append(controller.imageView.image!.description);
            PhotoArray.append(ImageRow(Title: "User Blah", Imager: controller.imageView.image!, Likes: UInt(arc4random_uniform(980))));
            PhotoTable.reloadData()
            //PhotoTable.insertRowsAtIndexPaths(PhotoTable.indexPathsForVisibleRows!, withRowAnimation: UITableViewRowAnimation.Automatic)

        }
    }
    

    
}

