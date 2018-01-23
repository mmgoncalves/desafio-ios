//
//  JSONRepositoryTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import XCTest
@testable import list_github_repository

class JSONRepositoryTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_should_map_jsonRepository() {
        let jsonData = StubJSONRepository.getData()
        
        do {
            let repositoryItem = try JSONDecoder().decode(RepositoryItem.self, from: jsonData)
            
            XCTAssertNotNil(repositoryItem, "JsonRepositoryItem should not be nil")
            XCTAssertEqual(repositoryItem.items.count, 1)
            let repository = repositoryItem.items.first
            
            XCTAssertNotNil(repository)
            XCTAssertNotNil(repository?.name)
            XCTAssertNotNil(repository?.id)
            XCTAssertNotNil(repository?.fullName)
            XCTAssertNotNil(repository?.stars)
            XCTAssertNotNil(repository?.forks)
            XCTAssertNotNil(repository?.body)
            XCTAssertNotNil(repository?.owner)
            
            let owner = repository?.owner
            XCTAssertNotNil(owner?.login)
            XCTAssertNotNil(owner?.avatarUrl)
            XCTAssertNotNil(owner?.id)
            
        } catch {
            XCTFail("parse Json to object failed. Error description: \(error)")
        }
    }
    
}
