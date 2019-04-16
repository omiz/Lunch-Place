//
//  Bundle.swift
//  Utility
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation

public extension Bundle {

    var version: String {
        let version = infoDictionary?["CFBundleShortVersionString"] as? String
        
        return version ?? ""
    }
    
    var buildNumber: String {
        let version = infoDictionary?["CFBundleVersion"] as? String
        
        return version ?? ""
    }
    
    var compileDate: Date {
        
        let bundleName = infoDictionary?["CFBundleName"] as? String ?? "Info.plist"
        
        guard let infoPath = path(forResource: bundleName, ofType: nil) else { return Date() }
        
        guard let infoAttr = try? FileManager.default.attributesOfItem(atPath: infoPath) else { return Date() }
        
        guard let creationDate = infoAttr[FileAttributeKey.creationDate] as? Date else { return Date() }
        
        return creationDate
    }
    
    var name: String {
        
        let name = infoDictionary?["CFBundleName"] as? String
        
        return name ?? ""
    }
}
