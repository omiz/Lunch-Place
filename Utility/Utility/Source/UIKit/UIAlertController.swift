//
//  UIAlertController.swift
//  Utility
//
//  Created by Omar Allaham on 5/13/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation
import UIKit

public func displayAlert(_ controller: UIAlertController,
                         animated flag: Bool = true,
                         completion: (() -> Void)? = nil) {
    
    guard let viewController = UIApplication.shared.keyWindow?.visibleViewController else {
        fatalError("The key window did not have a root view controller")
    }
    
    viewController.present(controller, animated: flag, completion: completion)
}

public
extension UIWindow {
    
    var visibleViewController: UIViewController? {
        
        var viewController = rootViewController
        
        while let presented = viewController?.presentedViewController {
            
            switch presented {
            case let controller as UINavigationController:
                viewController = controller.viewControllers.last
                
            case let controller as UITabBarController:
                viewController = controller.selectedViewController
                
            default:
                viewController = presented
            }
        }
        
        return viewController
    }
}
