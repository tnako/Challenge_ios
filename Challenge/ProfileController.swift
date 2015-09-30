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

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let loginButton = FBSDKLoginButton();
        loginButton.readPermissions = ["public_profile", "email", "user_friends"];
        loginButton.center = self.view.center;
        
        loginButton.delegate = self;
        self.view.addSubview(loginButton);
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
