//
//  MapItemTransformer.swift
//  CoreDataKit
//
//  Created by Omar Allaham on 4/11/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation
import MapKit

@objc(MapItemTransformer)
class MapItemTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return NSData.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        
        guard let data = value as? Data else { return nil }
        
        let items = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [MKMapItem]
        
        return items?.first
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        
        if #available(iOS 11.0, *) {
            return try? NSKeyedArchiver.archivedData(withRootObject: [value],
                                                     requiringSecureCoding: false)
        } else {
            return NSKeyedArchiver.archivedData(withRootObject: [value])
        }
    }
}

extension NSValueTransformerName {
    static let MapItemTransformerName = NSValueTransformerName(rawValue: "MapItemTransformer")
}


