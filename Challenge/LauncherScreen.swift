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
    @IBOutlet var BodyView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        BodyView.hidden = true;
        BodyView.alpha = 0;
        HeaderView.hidden = true;
        HeaderView.alpha = 0;
        
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
            self.HeaderView.alpha = 1;
            }, completion: nil)
        
        network.connect()

        network.socket.onConnect = {
            self.BodyView.hidden = false;
            
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                self.BodyView.alpha = 1;
                }, completion: nil)
            

            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                self.HeaderView.alpha = 0;
                }, completion: { (value: Bool) in
                    self.HeaderView.hidden = true;
            })

        }
        
        network.socket.onDisconnect = { (error: NSError?) in
            
            self.HeaderView.hidden = false;
            
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                self.HeaderView.alpha = 1;
                }, completion: nil)
            
            
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {
                self.BodyView.alpha = 0;
                }, completion: { (value: Bool) in
                    self.BodyView.hidden = true;
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }

}
