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
    
    var fbLoginButton:FBSDKLoginButton?;
    let network : NetClient = NetClient.sharedInstance;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (FBSDKAccessToken.currentAccessToken() == nil) {
            fbLoginButton = FBSDKLoginButton();
            fbLoginButton!.readPermissions = ["public_profile", "email", "user_friends"];
            fbLoginButton!.center = self.view.center;
            
            fbLoginButton!.delegate = self;
            self.view.addSubview(fbLoginButton!);
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            print("Send seque AuthDone");
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
            //ToDo: check success of login
            fbLoginButton?.removeFromSuperview();
            //ToDo: save data to server


            
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
}
