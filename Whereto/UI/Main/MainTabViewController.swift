//
//  MainTabViewController.swift
//  Whereto
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    private let selectedIndexKey = "selectedIndexKey"

    override func encodeRestorableState(with coder: NSCoder) {
        coder.encode(selectedIndex, forKey: selectedIndexKey)
        
        super.encodeRestorableState(with: coder)
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        selectedIndex =  coder.decodeInteger(forKey: selectedIndexKey)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

}
