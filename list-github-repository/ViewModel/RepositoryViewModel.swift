//
//  RepositoryViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

class RepositoryViewModel {
    
    var managedObjectContext: NSManagedObjectContext!
    var serviceDelegate: ServiceDelegate!
    var lastPage: Int16 = 1
    
    
    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var fetchResultControllerDelegate: NSFetchedResultsControllerDelegate!
    
    required init?(context: NSManagedObjectContext) {
        self.managedObjectContext = context

        self.fetchRepositories()
    }
    
    func initializeFetchResultsController() {
        let fetchRequest: NSFetchRequest<RepositoryEntity> = RepositoryEntity.fetchRequest()
        let sortByStars = NSSortDescriptor(key: "stars", ascending: false)
        let sortByPage = NSSortDescriptor(key: "page", ascending: true)
        
        fetchRequest.sortDescriptors = [sortByStars, sortByPage]
        
        self.fetchResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil
            ) as! NSFetchedResultsController<NSFetchRequestResult>
        
        self.fetchResultsController.delegate = self.fetchResultControllerDelegate
        
        do {
            try self.fetchResultsController.performFetch()
        } catch {}
    }
    
    func fetchRepositories() {
        if Generic.isConnectedToNetwork() {
            RepositoryService.makeRequest(withPage: self.lastPage, context: self.managedObjectContext) { error in
                if error == nil {
                    self.lastPage += 1
                }
                
                self.serviceDelegate.onFinish()
            }
        }
    }
}
