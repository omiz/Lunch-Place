//
//  UINib.swift
//  Utility
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import UIKit

public extension UINib {
    
    convenience init(_ name: String) {
        self.init(nibName: name, bundle: nil)
    }
}
