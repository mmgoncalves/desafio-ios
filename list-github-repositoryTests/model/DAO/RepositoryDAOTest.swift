//
//  RepositoryDAOTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import XCTest
import CoreData
@testable import list_github_repository

class RepositoryDAOTest: XCTestCase {
    
    var jsonRepositories: [JSONRepository]!
    var context: NSManagedObjectContext!
    
    override func setUp() {
        super.setUp()
        self.context = CoreDataHelper.setUpInMemoryManagedObjectContext()
        self.jsonRepositories = StubJSONRepository.getRepositories()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_should_save_repository() {
        
        RepositoryDAO.save(jsonRepositories: jsonRepositories, page: 1, inContext: context) { error in
            XCTAssertNil(error)
        }
    }
    
    func test_should_find_all_repositories() {
        
        RepositoryDAO.save(jsonRepositories: jsonRepositories, page: 1, inContext: context) { error in
            XCTAssertNil(error)
            
            let repositories = RepositoryDAO.all(inContext: self.context)
            
            XCTAssertNotNil(repositories)
            XCTAssertEqual(repositories?.count, 1)
            XCTAssertEqual(repositories?.first?.id, self.jsonRepositories.first?.id)
        }
    }
    
}
