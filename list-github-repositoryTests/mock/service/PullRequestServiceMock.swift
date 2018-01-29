//
//  PullRequestServiceMock.swift
//  list-github-repositoryTests
//
//  Created by Mateus Gonçalves on 25/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation
@testable import list_github_repository

struct PullRequestServiceMock: Service {
    func makeRequest(withPage page: Int, completion: @escaping RequestResult) {}

    func makeRequest(forRepository repository: Repository, completion: @escaping RequestResult) {
        let pullRequest = PullRequestMock.get(forRepository: repository)
        let result = Result.success(items: [pullRequest])

        completion(result)
    }
}

struct PullRequestServiceFailMock: Service {
    func makeRequest(withPage page: Int, completion: @escaping RequestResult) {}

    func makeRequest(forRepository repository: Repository, completion: @escaping RequestResult) {
        let error = PullRequestError.serviceResponse(localizedError: "Some error here")
        let result = Result.error(error)

        completion(result)
    }
}
