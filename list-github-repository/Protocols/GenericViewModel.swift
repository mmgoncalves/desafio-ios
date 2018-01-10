//
//  GenericViewModel.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation

protocol GenericViewModel {
    associatedtype T
    
    func numberOfRows() -> Int
    func numberOfSections() -> Int
    func item(atIndexPath indexPath: IndexPath) -> T?
    func fetchRequest()
}


