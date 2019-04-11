//
//  CoreDataManager.swift
//  Lunch Data
//
//  Created by Omar Allaham on 4/11/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import CoreData

class CoreDataManager: NSObject {

    static let shared: CoreDataManager = .init()
    
    let container: NSPersistentContainer = PersistentContainer(name: "LunchModel")
    
    override init() {
        super.init()
        
        load()
    }
    
    func load() {
        load(container)
    }
    
    func load(_ container: NSPersistentContainer) {
        
        container.loadPersistentStores(completionHandler: loadCompletionHandler)
    }
    
    func loadCompletionHandler(_ storeDescription: NSPersistentStoreDescription,
                               error: Error?) {
        
        if let error = error { fatalError((error as NSError).description) }
        
        storeDescription.shouldAddStoreAsynchronously = true
        
        storeDescription.shouldInferMappingModelAutomatically = true
        
        storeDescription.shouldMigrateStoreAutomatically = true
    }
    
    func newViewContext() -> NSManagedObjectContext {
        
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        context.parent = container.viewContext
        
        context.automaticallyMergesChangesFromParent = true
        
        return context
    }
    
    func newBackgroundContext() -> NSManagedObjectContext {
        
        let context = container.newBackgroundContext()
        
        context.automaticallyMergesChangesFromParent = true
        
        return context
    }
}
