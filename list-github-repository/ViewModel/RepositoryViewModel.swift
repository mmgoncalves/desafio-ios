//
//  RepositoryViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

class RepositoryViewModel: GenericViewModel {
    
    var items: [Codable] = []

    private let service: Service
    private var serviceDelegate: ServiceDelegate!
    private var lastPage: Int = 1
    
    init(service: Service, serviceDelegate: ServiceDelegate) {
        self.service = service
        self.serviceDelegate = serviceDelegate
    }
    
    func fetchRequest() {
        
        if Generic.isConnectedToNetwork() {
            self.service.makeRequest(withPage: self.lastPage, completion: { (result) in
                
                switch result {
                case .success(let items):
                    
                    self.updateItem(items: items)
                    self.updateNumberOfPage()
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
    
    private func updateNumberOfPage() {
        self.lastPage += 1
    }
}
