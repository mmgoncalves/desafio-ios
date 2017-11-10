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
    
    func test_should_save_and_find_pullRequest() {
        
        RepositoryDAO.save(jsonRepositories: jsonRepositories, page: 1, inContext: context) { error in
            XCTAssertNil(error)
            
            guard let repositoryId = self.jsonRepositories.first?.id else {
                XCTFail("RepositoryId should not be nil")
                return
            }
            
            PullRequestDAO.save(jsonPullRequests: self.jsonPullRequests, repositoryId: repositoryId, inContext: self.context) { error in
                XCTAssertNil(error)
                
                guard let allPullRequests = PullRequestDAO.all(inContext: self.context) else {
                    XCTFail("allPullRequests should not be nil")
                    return
                }
                
                XCTAssertNotNil(allPullRequests)
                XCTAssertEqual(allPullRequests.count, 1)
                
                guard let pullRequests = PullRequestDAO.find(byRepositoryId: repositoryId, inContext: self.context) else {
                    XCTFail("pullRequests should not be nil")
                    return
                }
                
                XCTAssertEqual(pullRequests.count, 1)
                XCTAssertEqual(self.jsonPullRequests.first?.id, pullRequests.first?.id)
                XCTAssertEqual(repositoryId, pullRequests.first?.repository?.id)
            }
        }
    }
}
