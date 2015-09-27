//
//  ChallengeDetailViewController.swift
//  Challenge
//
//  Created by Anton Korshikov on 26.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit


struct ImageRow {
    var Title: String;
    var Subtitle: String;
    var Imager: UIImage;
}


/* detail scene view controller
displays its item (the selected master list row) */
class ChallengeDetailViewController: UITableViewController {


    @IBOutlet var PhotoTable: UITableView!
    var PhotoArray = [ImageRow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PhotoArray.append(ImageRow(Title: "Lorem", Subtitle: "Bla bla", Imager: UIImage(named: "camaro_512")!));
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
        cell.Subtitle.text = PhotoArray[row].Subtitle;
        cell.Title.text = PhotoArray[row].Title;
        cell.Imager.image = PhotoArray[row].Imager;

        
        return cell
    }
    
    @IBAction func saveNewPhoto(segue:UIStoryboardSegue) {
        
        if let controller = segue.sourceViewController as? TakePhotoController {
            
            //PhotoArray.append(controller.imageView.image!.description);
            PhotoArray.append(ImageRow(Title: "New", Subtitle: "One", Imager: controller.imageView.image!));
            PhotoTable.reloadData()
            //PhotoTable.insertRowsAtIndexPaths(PhotoTable.indexPathsForVisibleRows!, withRowAnimation: UITableViewRowAnimation.Automatic)

        }
    }
    
}

