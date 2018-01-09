//
//  BaseViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 14/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

class BaseViewModel: GenericViewModel {
    
    var managedObjectContext: NSManagedObjectContext!
    
    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var fetchResultControllerDelegate: NSFetchedResultsControllerDelegate!
    
    required init?(context: NSManagedObjectContext) {
        self.managedObjectContext = context
    }
    
    func fetchRequest() { }
    
    func configureFetchResultsController(fetchRequest: NSFetchRequest<NSFetchRequestResult>) {
        
        self.fetchResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: self.managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        self.fetchResultsController.delegate = self.fetchResultControllerDelegate
        
        do {
            try self.fetchResultsController.performFetch()
        } catch {}
    }
    
    func numberOfRows() -> Int {
        let sections = self.numberOfSections()
        return self.fetchResultsController.sections?[sections - 1].numberOfObjects ?? 0
    }
    
    func numberOfSections() -> Int {
        return self.fetchResultsController.sections?.count ?? 0
    }
    
    func getRepository(atIndexPath indexPath: IndexPath) -> RepositoryEntity? {
        guard let repository = self.fetchResultsController.object(at: indexPath) as? RepositoryEntity else {
            return nil
        }
        
        return repository
    }
}
