//
//  PersistentContainer.swift
//  CoreDataKit
//
//  Created by Omar Allaham on 4/11/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import CoreData

class PersistentContainer: NSPersistentContainer {

    override class func defaultDirectoryURL() -> URL {
        return super.defaultDirectoryURL().appendingPathComponent("CoreDataKit")
    }
}
