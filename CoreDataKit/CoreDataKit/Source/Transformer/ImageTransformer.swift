//
//  ImageTransformer.swift
//  CoreDataKit
//
//  Created by Omar Allaham on 4/11/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import Foundation
import UIKit

@objc(ImageTransformer)
class ImageTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass {
        return NSData.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        return UIImage(data: data)
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }
        
        return image.pngData()
    }
}

extension NSValueTransformerName {
    static let imageTransformerName = NSValueTransformerName(rawValue: "ImageTransformer")
}


