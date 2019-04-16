//
//  UIViewController+Instance.swift
//  Utility
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation
import UIKit

@objc public protocol StoryboardComponemt: AnyObject {
    @objc optional static var storyboardName: String { get }
}

public extension UIStoryboard {
    
    func instantiate<T: UIViewController>(_ type: T.Type) -> T {
        
        return instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
    
    func instantiate<T: UIViewController>(_ identifier: String) -> T {
        
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}

extension UIViewController: StoryboardComponemt {}

public extension StoryboardComponemt where Self: UIViewController {
}

public extension UIViewController {
    
    class func instance(in storyboard: String) -> Self {
        
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        return instance(in: storyboard)
    }
    
    class func instance(in storyboard: UIStoryboard!) -> Self {
        guard let storyboard = storyboard else {
            fatalError("Requesting instance of " + String(describing: self) + " from nil storyboard")
        }
        
        return storyboard.instantiate(self)
    }
    
    class func instance() -> Self {
        
        let selector = NSSelectorFromString("storyboardName")
        
        guard responds(to: selector) else {
            fatalError("Please provide 'static var storyboardName: String { get }' in: " + String(describing: self))
        }
        
        guard let name = value(forKey: "storyboardName") as? String, !name.isEmpty else {
            fatalError("Please provide 'static var storyboardName: String { get }' in: " + String(describing: self))
        }
        
        return instance(in: name)
    }
    
    class func instance(named identifier: String, in storyboard: String) -> Self {
        
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        return instance(named: identifier, in: storyboard)
    }
    
    class func instance(named identifier: String, in storyboard: UIStoryboard!) -> Self {
        
        guard let storyboard = storyboard else {
            fatalError("Requesting instance of " + String(describing: self) + " from nil storyboard")
        }
        
        
        
        return storyboard.instantiate(identifier)
    }
}
