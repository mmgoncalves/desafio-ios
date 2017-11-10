//
//  PullRequestDAOTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import XCTest
import CoreData
@testable import list_github_repository

class PullRequestDAOTest: XCTestCase {
    
    var jsonPullRequests: [JSONPullRequest]!
    var jsonRepositories: [JSONRepository]!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        
        self.context = CoreDataHelper.setUpInMemoryManagedObjectContext()
        self.jsonPullRequests = StubJSONPullRequest.getPullRequests()
        self.jsonRepositories = StubJSONRepository.getRepositories()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_should_save_pullRequest() {
        
        RepositoryDAO.save(jsonRepositories: jsonRepositories, page: 1, inContext: context) { error in
            XCTAssertNil(error)
            
            guard let repositoryId = self.jsonRepositories.first?.id else {
                XCTFail("RepositoryId should not be nil")
                return
            }
            
            PullRequestDAO.save(jsonPullRequests: self.jsonPullRequests, repositoryId: repositoryId, inContext: self.context) { error in
                XCTAssertNil(error)
            }
        }
    }
}
