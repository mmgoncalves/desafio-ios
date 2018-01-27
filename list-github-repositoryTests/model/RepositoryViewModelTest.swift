//
//  RepositoryTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Gonçalves on 25/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import XCTest
import Nimble
@testable import list_github_repository

class RepositoryTest: XCTestCase, ServiceDelegate {
    
    private var sut: RepositoryViewModel!
    
    override func setUp() {
        super.setUp()
        
        let service = RepositoryServiceMock()
        
        self.sut = RepositoryViewModel(service: service, serviceDelegate: self)
        expect(self.sut).toNot(beNil())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_items_Should_be_equal_1() {
        let items = self.sut.items
        expect(items.count).to(equal(1))
    }
    
    func test_items_should_be_updatable() {
        let newRepository = RepositoryMock.get()
        self.sut.updateItem(items: [newRepository])
        
        expect(self.sut.items.count).to(equal(2))
        expect(self.sut.items.count).toNot(equal(1))
    }
    
    func requestSuccess(items: [Codable]) {
        expect(items.count).to(beGreaterThan(0))
    }
    
    func requestFailed(error: AppError) {
        expect(error).toNot(beNil())
    }

}
