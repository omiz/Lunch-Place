//
//  String.swift
//  Utility
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation

public extension String {
    
    var localized: String {
        
        let localizedString: String = NSLocalizedString(self, comment: "")
        
        return localizedString
    }
    
    var abbreviated: String {
        
        let localizedString: String = NSLocalizedString(self, tableName: "Localizable.Abbreviated", comment: "")
        
        return localizedString
    }
    
    func localized(_ arguments: CVarArg...) -> String {
        
        let localizedString: String = localized
        
        let argumented = String(format: localizedString, arguments: arguments)
        
        return argumented
    }
    
    func localized(in locale: Locale) -> String {
        
        guard let languageCode = locale.languageCode else { return self }
        
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") else {
            return self
        }
        
        guard let bundle = Bundle(path: path) else {
            return self
        }
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
    
    static var random: String {
        return UUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
    
    
    init(class anyClass: AnyClass) {
        
        let name = NSStringFromClass(anyClass).components(separatedBy: ".").last
        
        self.init(describing: name ?? String(describing: anyClass))
    }
}
