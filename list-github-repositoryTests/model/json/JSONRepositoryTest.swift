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
            let jsonRepositoryItem = try JSONDecoder().decode(JSONRepositoryItem.self, from: jsonData)
            
            XCTAssertNotNil(jsonRepositoryItem, "JsonRepositoryItem should not be nil")
            XCTAssertEqual(jsonRepositoryItem.items.count, 1)
            let jsonRepository = jsonRepositoryItem.items.first
            
            XCTAssertNotNil(jsonRepository)
            XCTAssertNotNil(jsonRepository?.name)
            XCTAssertNotNil(jsonRepository?.id)
            XCTAssertNotNil(jsonRepository?.full_name)
            XCTAssertNotNil(jsonRepository?.stargazers_count)
            XCTAssertNotNil(jsonRepository?.forks_count)
            XCTAssertNotNil(jsonRepository?.owner)
            
            let jsonOwner = jsonRepository?.owner
            XCTAssertNotNil(jsonOwner?.login)
            XCTAssertNotNil(jsonOwner?.avatar_url)
            XCTAssertNotNil(jsonOwner?.id)
            
        } catch {
            XCTFail("parse Json to object failed. Error description: \(error)")
        }
    }
    
}
