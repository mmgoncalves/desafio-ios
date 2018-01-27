//
//  JSONRepositoryTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import XCTest
import Nimble
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
            
            expect(repositoryItem).toNot(beNil(), description: "JsonRepositoryItem should not be nil")
            expect(repositoryItem.items.count).to(equal(1))
            
            let repository = repositoryItem.items.first
            
            expect(repository).toNot(beNil())
            expect(repository?.name).toNot(beNil())
            expect(repository?.id).toNot(beNil())
            expect(repository?.fullName).toNot(beNil())
            expect(repository?.stars).toNot(beNil())
            expect(repository?.forks).toNot(beNil())
            expect(repository?.body).toNot(beNil())
            expect(repository?.owner).toNot(beNil())
            
            let owner = repository?.owner
            XCTAssertNotNil(owner?.login)
            XCTAssertNotNil(owner?.avatarUrl)
            XCTAssertNotNil(owner?.id)
            
        } catch {
            XCTFail("parse Json to object failed. Error description: \(error)")
        }
    }
    
}
