//
//  PullRequestViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

class PullRequestViewModel: BaseViewModel {
    
    var pullRequests: [JSONPullRequest]?
    var serviceDelegate: ServiceDelegate!
    private var repository: RepositoryEntity!
    
    required init?(repository: RepositoryEntity, context: NSManagedObjectContext) {
        super.init(context: context)
        self.repository = repository
        self.fetchPullRequests()
    }
    
    required init?(context: NSManagedObjectContext) {
        fatalError("init(context:) has not been implemented")
    }
    
    func initializeFetchResultsController() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = PullRequestEntity.fetchRequest()
        let sortById = NSSortDescriptor(key: "id", ascending: false)
        let predicate = NSPredicate(format: "repository.id = %@", argumentArray: [self.repository.id])
        
        fetchRequest.sortDescriptors = [sortById]
        fetchRequest.predicate = predicate
        
        self.configureFetchResultsController(fetchRequest: fetchRequest)
    }
    
    private func fetchPullRequests() {
        if Generic.isConnectedToNetwork() {
            PullRequestService.makeRequest(forRepository: self.repository, context: self.managedObjectContext) { error in
                self.serviceDelegate.onFinish()
            }
        }
    }
}
