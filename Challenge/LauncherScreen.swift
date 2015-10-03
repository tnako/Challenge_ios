//
//  LauncherScreen.swift
//  Challenge
//
//  Created by Anton Korshikov on 30.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//


import UIKit

class LauncherScreenController: UIViewController {
    
    let network : NetClient = NetClient.sharedInstance;
    
    @IBOutlet var HeaderView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad();

        HeaderView.hidden = false;
        HeaderView.alpha = 0.2;
        
        
        UIView.animateWithDuration(0.2, delay: 0, options: .CurveEaseOut, animations: {
            self.HeaderView.alpha = 1;
            }, completion: nil)
        
        network.connect()

        network.socket.onConnect = {
            self.performSegueWithIdentifier("Connected", sender: self);

            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                self.HeaderView.alpha = 0;
                }, completion: { (value: Bool) in
                    self.HeaderView.hidden = true;
            })

        }
        
        network.socket.onDisconnect = { (error: NSError?) in
            if (self.HeaderView.hidden) {
                print("Show Launcher view");
                self.HeaderView.hidden = false;
            
                UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                    self.HeaderView.alpha = 1;
                    }, completion: nil);
            }

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }

}
