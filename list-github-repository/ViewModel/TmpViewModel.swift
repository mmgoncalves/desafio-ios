//
//  TmpViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 13/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//


import Foundation

class TmpViewModel: GenericViewModel {
    
    var items: [Codable] = []
    
    var serviceDelegate: ServiceDelegate!
    var lastPage: Int = 1
    
    init() {
        let owner = Owner(login: "Login", id: 2, avatarUrl: "https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png")
        let repository = Repository(id: 1, name: "Name", fullName: "Full-name", stars: 11, forks: 22, body: "Body", owner: owner)
        self.updateItem(items: [repository])
    }
    
    func fetchRequest() {
        
    }
    
    func updateItem(items: [Codable]) {
        self.items.append(contentsOf: items)
    }
    
    private func updateNumberOfPage() {
        self.lastPage += 1
    }
}
