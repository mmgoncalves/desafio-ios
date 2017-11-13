//
//  PullRequestViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

class PullRequestViewModel {
    
    var managedObjectContext: NSManagedObjectContext!
    var pullRequests: [JSONPullRequest]?
    private var repository: RepositoryEntity!
    
    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var fetchResultsControllerDelegate: NSFetchedResultsControllerDelegate!
    
    var serviceDelegate: ServiceDelegate!
    
    required init?(repository: RepositoryEntity, context: NSManagedObjectContext) {
        self.managedObjectContext = context
        self.repository = repository
        self.fetchPullRequests()
    }
    
    func initializeFetchResultsController() {
        let fetchRequest: NSFetchRequest<PullRequestEntity> = PullRequestEntity.fetchRequest()
        let sortById = NSSortDescriptor(key: "id", ascending: false)
        let predicate = NSPredicate(format: "repository.id = %@", argumentArray: [self.repository.id])
        
        fetchRequest.sortDescriptors = [sortById]
        fetchRequest.predicate = predicate
        
        self.fetchResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil
            ) as! NSFetchedResultsController<NSFetchRequestResult>
        
        self.fetchResultsController.delegate = self.fetchResultsControllerDelegate
        
        do {
            try self.fetchResultsController.performFetch()
        } catch {}
    }
    
    private func fetchPullRequests() {
        if Generic.isConnectedToNetwork() {
            PullRequestService.makeRequest(forRepository: self.repository, context: self.managedObjectContext) { error in
                self.serviceDelegate.onFinish()
            }
        }
    }
}
