//
//  PullRequestViewModelTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Gonçalves on 26/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import XCTest
import Nimble
@testable import list_github_repository

class PullRequestViewModelTest: XCTestCase, ServiceDelegate {
    
    private var sut: PullRequestViewModel!
    private let repository = RepositoryMock.get()
    
    override func setUp() {
        super.setUp()
        let service = PullRequestServiceMock()
        self.sut = PullRequestViewModel(repository: self.repository, service: service, serviceDelegate: self)
        
        expect(self.sut).toNot(beNil())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_number_of_sections_and_rows() {
        expect(self.sut.numberOfRows()).to(equal(0))
        expect(self.sut.numberOfSections()).to(equal(0))

        self.sut.fetchRequest()

        expect(self.sut.numberOfRows()).to(equal(1))
        expect(self.sut.numberOfSections()).to(equal(1))
    }

    func test_items_should_be_not_nil() {
        self.sut.fetchRequest()

        let items = self.sut.items
        
        expect(items.count).to(equal(1))
        expect(self.sut.numberOfSections()).to(equal(1))
        expect(self.sut.numberOfRows()).to(equal(1))
    }
    
    func test_items_should_be_updatable() {
        self.sut.fetchRequest()
        
        let newItem = PullRequestMock.get(forRepository: self.repository)
        self.sut.updateItem(items: [newItem])
        
        expect(self.sut.items.count).to(equal(2))
        expect(self.sut.items.count).toNot(equal(1))
    }

    func test_service_error() {
        let serviceWithError = PullRequestServiceFailMock()
        let pullRequestViewModel = PullRequestViewModel(repository: self.repository, service: serviceWithError, serviceDelegate: self)
        pullRequestViewModel.fetchRequest()
    }
    
    func requestSuccess(items: [Codable]) {
        expect(items.count).to(beGreaterThan(0))
    }
    
    func requestFailed(error: AppError) {
        expect(error).toNot(beNil())
    }

    
}
