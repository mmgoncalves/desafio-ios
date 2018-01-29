//
//  PullRequestViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

class PullRequestViewModel: GenericViewModel {
    
    var items: [Codable] = []
    
    var pullRequests: [PullRequest]?
    private var serviceDelegate: ServiceDelegate
    private var repository: Repository
    private let service: Service
    
    init(repository: Repository, service: Service, serviceDelegate: ServiceDelegate) {
        
        self.repository = repository
        self.service = service
        self.serviceDelegate = serviceDelegate
    }
    
    func fetchRequest() {
        if Generic.isConnectedToNetwork() {
            self.service.makeRequest(forRepository: self.repository, completion: { (result) in
                
                switch result {
                    case .success(let items):
                        self.updateItem(items: items)
                        self.serviceDelegate.requestSuccess(items: items)
                    
                    case .error(let error):
                        self.serviceDelegate.requestFailed(error: error)
                }
                
            })
        }
    }
    
    func updateItem(items: [Codable]) {
        self.items.append(contentsOf: items)
    }
}
