//
//  AuthController.swift
//  Challenge
//
//  Created by Anton Korshikov on 30.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class AuthController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (FBSDKAccessToken.currentAccessToken() == nil) {
            let loginButton = FBSDKLoginButton();
            loginButton.readPermissions = ["public_profile", "email", "user_friends"];
            loginButton.center = self.view.center;
            
            loginButton.delegate = self;
            self.view.addSubview(loginButton);
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            self.performSegueWithIdentifier("AuthDone", sender: self);
        }
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
        print("LogOut");
    }
    
}
