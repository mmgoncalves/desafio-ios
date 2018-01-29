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

    func test_number_of_sections_and_rows() {
        expect(self.sut.numberOfRows()).to(equal(0))
        expect(self.sut.numberOfSections()).to(equal(0))

        self.sut.fetchRequest()

        expect(self.sut.numberOfRows()).to(equal(1))
        expect(self.sut.numberOfSections()).to(equal(1))
    }

    func test_find_item_at_indexPath() {
        let indexPath = IndexPath(row: 0, section: 0)

        expect(self.sut.item(atIndexPath: indexPath)).to(beNil())

        self.sut.fetchRequest()
        expect(self.sut.item(atIndexPath: indexPath)).toNot(beNil())
    }

    func test_items_Should_be_equal_1() {
        self.sut.fetchRequest()

        let items = self.sut.items
        expect(items.count).to(equal(1))
    }
    
    func test_items_should_be_updatable() {
        self.sut.fetchRequest()
        
        let newRepository = RepositoryMock.get()
        self.sut.updateItem(items: [newRepository])
        
        expect(self.sut.items.count).to(equal(2))
        expect(self.sut.items.count).toNot(equal(1))
    }

    func test_service_error() {
        let serviceWithError = RepositoryServiceFailMock()
        let repositoryViewModel = RepositoryViewModel(service: serviceWithError, serviceDelegate: self)
        repositoryViewModel.fetchRequest()
    }
    
    func requestSuccess(items: [Codable]) {
        expect(items.count).to(beGreaterThan(0))
    }
    
    func requestFailed(error: AppError) {
        expect(error).toNot(beNil())
    }

}
