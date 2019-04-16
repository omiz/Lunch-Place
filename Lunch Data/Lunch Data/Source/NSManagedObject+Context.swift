//
//  NSManagedObject+Context.swift
//  Lunch Data
//
//  Created by Omar Allaham on 4/11/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import CoreData
import Utility

public protocol ManagedObjectProtocol {}

extension NSManagedObject: ManagedObjectProtocol {}

public extension ManagedObjectProtocol where Self: NSManagedObject {
    
    typealias UpdateBlock = (Self) -> Void
    
    typealias CompletionBlock = (Error?) -> Void
    
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
    
    static func new() {
        
        new { _ in }
    }
    
    static func new(_ updateBlock: @escaping UpdateBlock) {
        
        new(updateBlock) { _ in }
    }
    
    static func new(_ updateBlock: @escaping UpdateBlock, completion: @escaping CompletionBlock) {

        let context = CoreDataManager.shared.newBackgroundContext()
        
        context.perform {
            
             let entityName = String(class: self)
            
            if let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) {

                updateBlock(Self(entity: entity, insertInto: context))
            }
            
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func update(_ block: @escaping UpdateBlock, completion: CompletionBlock? = nil) {
        
        let context = CoreDataManager.shared.newBackgroundContext()
        
        let object = context.object(with: objectID) as! Self
        
        context.perform {
            
            block(object)
            
            do {
                try context.save()
                completion?(nil)
            } catch {
                completion?(error)
            }
        }
    }
}
