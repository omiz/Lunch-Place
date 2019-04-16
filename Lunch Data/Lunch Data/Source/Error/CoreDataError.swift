//
//  CoreDataError.swift
//  Lunch Data
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation

class CoreDataError: NSError {
    
    static var domain: String {
        
        let bundle = Bundle(for: CoreDataError.self)
        
        return "\(bundle.bundleIdentifier ?? "").CoreDataError"
    }
    
    init(code: Int, userInfo dict: [String : Any]? = nil) {
        super.init(domain: CoreDataError.domain, code: code, userInfo: dict)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
