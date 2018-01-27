//
//  JSONPullRequestTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import XCTest
import Nimble
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
            
            expect(pullRequest).toNot(beNil(), description: "jsonPullRequest should not be nil")

            expect(pullRequest.first?.body).toNot(beNil())
            expect(pullRequest.first?.title).toNot(beNil())
            expect(pullRequest.first?.id).toNot(beNil())
            expect(pullRequest.first?.createdAt).toNot(beNil())
            expect(pullRequest.first?.url).toNot(beNil())
            expect(pullRequest.first?.information).toNot(beNil())
        } catch {
            XCTFail("Parse json to object failed. Error description: \(error)")
        }
    }
    
}
