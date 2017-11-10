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
            let jsonPullRequest = try JSONDecoder().decode([JSONPullRequest].self, from: jsonData)
            
            XCTAssertNotNil(jsonPullRequest, "jsonPullRequest should not be nil")
            
            XCTAssertNotNil(jsonPullRequest.first?.body)
            XCTAssertNotNil(jsonPullRequest.first?.title)
            XCTAssertNotNil(jsonPullRequest.first?.id)
            XCTAssertNotNil(jsonPullRequest.first?.created_at)
            XCTAssertNotNil(jsonPullRequest.first?.url)
            XCTAssertNotNil(jsonPullRequest.first?.head)
        } catch {
            XCTFail("Parse json to object failed. Error description: \(error)")
        }
    }
    
}
