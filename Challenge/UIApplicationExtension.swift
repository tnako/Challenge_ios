//
//  UIApplicationExtension.swift
//  Challenge
//
//  Created by Anton Korshikov on 03.10.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
        /*
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }*/
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
