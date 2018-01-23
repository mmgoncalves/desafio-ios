//
//  RepositoryMock.swift
//  list-github-repositoryTests
//
//  Created by Mateus Marques on 22/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation
@testable import list_github_repository

struct RepositoryMock {
    static func get() -> Repository{
        
        let owner = Owner(login: "login", id: 2, avatarUrl: "url")
        let repository = Repository(id: 1, name: "Joao", fullName: "Joao da Silva", stars: 11, forks: 22, body: "Body", owner: owner)
        return repository
    }
}

