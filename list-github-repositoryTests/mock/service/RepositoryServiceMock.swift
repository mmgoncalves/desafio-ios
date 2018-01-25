//
//  RepositoryServiceMock.swift
//  list-github-repositoryTests
//
//  Created by Mateus Gonçalves on 25/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation
@testable import list_github_repository

struct RepositoryServiceMock: Service {
    func makeRequest(forRepository repository: Repository, completion: @escaping RequestResult) {}

    func makeRequest(withPage page: Int, completion: @escaping RequestResult) {
        let repository = RepositoryMock.get()
        let result = Result.success(items: [repository])

        completion(result)
    }
}
