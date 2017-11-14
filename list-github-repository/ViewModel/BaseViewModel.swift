//
//  BaseViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 14/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

class BaseViewModel: FetchResultsControllerViewModel {
    
    var managedObjectContext: NSManagedObjectContext!
    
    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult>!
    var fetchResultControllerDelegate: NSFetchedResultsControllerDelegate!
    
    required init?(context: NSManagedObjectContext) {
        self.managedObjectContext = context
    }
    
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
}

extension BaseViewModel {
    var numberOfSections: Int {
        get {
            return self.fetchResultsController.sections?.count ?? 0
        }
    }
    var numberOfObjects: Int {
        get {
            return self.fetchResultsController.sections?[self.numberOfSections - 1].numberOfObjects ?? 0
        }
    }
    
    func repository(at indexPath: IndexPath) -> RepositoryEntity? {
        guard let repository = self.fetchResultsController.object(at: indexPath) as? RepositoryEntity else {
            return nil
        }
        
        return repository
    }
    
}
