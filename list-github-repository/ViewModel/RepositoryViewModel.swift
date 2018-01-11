//
//  RepositoryViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

class RepositoryViewModel: BaseViewModel {
    
    var serviceDelegate: ServiceDelegate!
    var lastPage: Int16!
    
    required init?(context: NSManagedObjectContext) {
        super.init(context: context)
        
        self.lastPage = RepositoryDAO.getLastPage(inContext: context)
        
        if self.lastPage == 1 {
            self.fetchRequest()
        }
    }
    
    func initializeFetchResultsController() {
        let fetchRequest = RepositoryDAO.fetchRequestDefault()
        
        self.configureFetchResultsController(fetchRequest: fetchRequest)
    }
    
    override func fetchRequest() {
        super.fetchRequest()
        
        if Generic.isConnectedToNetwork() {
            RepositoryService.makeRequest(withPage: self.lastPage, context: self.managedObjectContext) { error in
                if error == nil {
                    self.lastPage = self.lastPage + 1
                }
                self.serviceDelegate.onFinish()
            }
        }
    }
}
