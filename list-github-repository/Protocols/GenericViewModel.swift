//
//  GenericViewModel.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import CoreData

protocol GenericViewModel {
    var fetchResultsController: NSFetchedResultsController<NSFetchRequestResult>! {get set}
    
    func numberOfRows(inSection section: Int) -> Int
    func numberOfRows() -> Int
    func numberOfSections() -> Int
    func item(atIndexPath indexPath: IndexPath) -> NSManagedObject?
    func fetchRequest()
}

extension GenericViewModel {
    func numberOfRows(inSection section: Int) -> Int {
        return self.fetchResultsController.sections?[section].numberOfObjects ?? 0
    }
    
    func numberOfRows() -> Int {
        let sections = self.numberOfSections()
        return self.fetchResultsController.sections?[sections - 1].numberOfObjects ?? 0
    }
    
    func numberOfSections() -> Int {
        return self.fetchResultsController.sections?.count ?? 0
    }
    
    func item(atIndexPath indexPath: IndexPath) -> NSManagedObject? {
        guard let nsObject = self.fetchResultsController.object(at: indexPath) as? NSManagedObject else {
            return nil
        }
        
        return nsObject
    }
}
