//
//  PullRequestMock.swift
//  list-github-repositoryTests
//
//  Created by Mateus Gonçalves on 25/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation
@testable import list_github_repository

struct PullRequestMock {
    static func get(forRepository: Repository) -> PullRequest {
        let repository = RepositoryMock.get()
        let owner = Owner(login: "Login owner", id: 3, avatarUrl: "avatar url")
        let information = Head(owner: owner, repository: repository)
        let pullRequest = PullRequest(url: "URL", id: 2, title: "Title", body: "", createdAt: "", information: information)

        return pullRequest
    }
}
