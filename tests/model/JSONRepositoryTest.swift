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
            let jsonRepository = try JSONDecoder().decode(JSONRepositoryItem.self, from: jsonData)
            
            XCTAssertNotNil(jsonRepository)
        } catch {
            XCTFail("parse Json to object failed")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
