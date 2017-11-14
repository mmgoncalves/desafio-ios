//
//  FetchResultsControllerViewModel.swift
//  list-github-repository
//
//  Created by Mateus Marques on 14/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation
import CoreData

protocol FetchResultsControllerViewModel {
    var numberOfSections: Int {get}
    var numberOfObjects: Int {get}
    func repository(at indexPath: IndexPath) -> RepositoryEntity?
}
