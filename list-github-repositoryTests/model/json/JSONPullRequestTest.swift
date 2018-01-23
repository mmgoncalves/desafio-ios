//
//  JSONPullRequestTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import XCTest
@testable import list_github_repository

class JSONPullRequestTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_should_map_jsonPullRequest() {
        let jsonData = StubJSONPullRequest.getData()
        
        do {
            let pullRequest = try JSONDecoder().decode([PullRequest].self, from: jsonData)
            
            XCTAssertNotNil(pullRequest, "jsonPullRequest should not be nil")
            
            XCTAssertNotNil(pullRequest.first?.body)
            XCTAssertNotNil(pullRequest.first?.title)
            XCTAssertNotNil(pullRequest.first?.id)
            XCTAssertNotNil(pullRequest.first?.createdAt)
            XCTAssertNotNil(pullRequest.first?.url)
            XCTAssertNotNil(pullRequest.first?.information)
        } catch {
            XCTFail("Parse json to object failed. Error description: \(error)")
        }
    }
    
}
