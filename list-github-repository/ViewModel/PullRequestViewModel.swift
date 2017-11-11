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
    
    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var fetchResultsControllerDelegate: NSFetchedResultsControllerDelegate!
    
    var serviceDelegate: ServiceDelegate!
    
    required init?(repository: RepositoryEntity, context: NSManagedObjectContext) {
        self.managedObjectContext = context
        self.fetchPullRequests(repository: repository)
    }
    
    func initializeFetchResultsController() {
        let fetchRequest: NSFetchRequest<PullRequestEntity> = PullRequestEntity.fetchRequest()
        let sortById = NSSortDescriptor(key: "id", ascending: false)
        fetchRequest.sortDescriptors = [sortById]
        
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
    
    private func fetchPullRequests(repository: RepositoryEntity) {
        if Generic.isConnectedToNetwork() {
            PullRequestService.makeRequest(forRepository: repository, context: self.managedObjectContext) { error in
                self.serviceDelegate.onFinish()
            }
        }
    }
}
