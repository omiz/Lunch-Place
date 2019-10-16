//
//  CoreDataError.swift
//  CoreDataKit
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation

class CoreDataError: NSError {
    
    static var domain: String {
        
        let bundle = Bundle(for: CoreDataError.self)
        
        return "\(bundle.bundleIdentifier ?? "").Error"
    }
    
    init(code: Int, userInfo dict: [String : Any]? = nil) {
        super.init(domain: CoreDataError.domain, code: code, userInfo: dict)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
