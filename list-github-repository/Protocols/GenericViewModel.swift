//
//  GenericViewModel.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation

protocol GenericViewModel {
    func numberOfRows() -> Int
    func numberOfSections() -> Int
    func getRepository(atIndexPath indexPath: IndexPath) -> RepositoryEntity?
    func fetchRequest()
}
