//
//  NSManagedObject+Context.swift
//  Lunch Data
//
//  Created by Omar Allaham on 4/11/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import CoreData
import Utility

protocol ManagedObjectProtocol {}

extension NSManagedObject: ManagedObjectProtocol {}

extension ManagedObjectProtocol where Self: NSManagedObject {
    
    fileprivate static var context: NSManagedObjectContext {
        return CoreDataManager.shared.newViewContext()
    }
    
    static func find(predicate: NSPredicate = NSPredicate(value: true),
                     sortDescriptors: [NSSortDescriptor] = []) -> [Self] {
        
        let fetchRequest = NSFetchRequest<Self>(entityName: String(class: self))
        
        fetchRequest.predicate = predicate
        
        fetchRequest.sortDescriptors = sortDescriptors
        
        let result = try? context.fetch(fetchRequest)
        
        return result ?? []
    }
}
