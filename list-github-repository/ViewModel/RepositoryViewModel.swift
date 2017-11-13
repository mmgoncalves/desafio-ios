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
    var lastPage: Int16 {
        get {
            return self.lastPage
        } set {
           self.lastPage = newValue
            self.fetchRepositories(forPage: self.lastPage)
        }
    }
    
    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var fetchResultControllerDelegate: NSFetchedResultsControllerDelegate!
    
    required init?(context: NSManagedObjectContext) {
        self.managedObjectContext = context
//        self.lastPage = 1
    }
    
    func initializeFetchResultsController() {
        let fetchRequest: NSFetchRequest<RepositoryEntity> = RepositoryEntity.fetchRequest()
        let sortByStars = NSSortDescriptor(key: "stars", ascending: false)
        
        fetchRequest.sortDescriptors = [sortByStars]
        
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
    
    private func fetchRepositories(forPage page: Int16) {
        if Generic.isConnectedToNetwork() {
            RepositoryService.makeRequest(withPage: page, context: self.managedObjectContext) { error in
                self.serviceDelegate.onFinish()
            }
        }
    }
}
