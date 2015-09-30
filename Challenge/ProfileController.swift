//
//  SecondViewController.swift
//  Challenge
//
//  Created by Anton Korshikov on 25.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ProfileController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet var imageURL: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let loginButton = FBSDKLoginButton();
        loginButton.readPermissions = ["public_profile", "email", "user_friends"];
        loginButton.center = self.view.center;
        
        loginButton.delegate = self;
        self.view.addSubview(loginButton);
        
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "name, email, friends, id, birthday, picture, gender"])
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let pictureDict = result.objectForKey("picture") as! NSDictionary
                let pictureData = pictureDict.objectForKey("data") as! NSDictionary
                let pictureURL = pictureData.objectForKey("url") as! String
                print("picture.data.url: \(pictureURL)")
                
                if let url = NSURL(string: pictureURL) {
                    if let data = NSData(contentsOfURL: url){
                        self.imageURL.image = UIImage(data: data)
                    }
                }
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if (error != nil) {
            print("Login error: \(error.localizedDescription)")
        } else {
            //ToDo: save data to server
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        self.performSegueWithIdentifier("Logout", sender: self);
    }
}
