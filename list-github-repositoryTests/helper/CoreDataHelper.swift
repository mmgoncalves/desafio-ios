//
//  CoreDataHelper.swift
//  list-github-repositoryTests
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation
import CoreData
@testable import list_github_repository

struct CoreDataHelper {
    static func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let url = Bundle.main.url(forResource: "list_github_repository", withExtension: "momd")!
        let managedObjectModel = NSManagedObjectModel(contentsOf: url)
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel!)
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        } catch {
            print("Error to create mock for NSManagedObjectContext")
        }
        
        let managedObjecContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjecContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        return managedObjecContext
    }
}
