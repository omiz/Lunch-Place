//
//  String.swift
//  Utility
//
//  Created by Omar Allaham on 4/11/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation

public extension String {
 
    init(class anyClass: AnyClass) {
        
        let name = NSStringFromClass(anyClass).components(separatedBy: ".").last
        
        self.init(describing: name ?? String(describing: anyClass))
    }
}
