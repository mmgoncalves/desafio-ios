//
//  RepositoryTest.swift
//  list-github-repositoryTests
//
//  Created by Mateus Gonçalves on 25/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import list_github_repository

class RepositoryTest: XCTestCase {

    private var sut: RepositoryViewModel!
    
    override func setUp() {

        super.setUp()

        self.sut = RepositoryViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
    }

}
