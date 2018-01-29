//
//  GenericViewModel.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation

protocol GenericViewModel {
    var items: [Codable] {get set}
    
    func numberOfRows() -> Int
    func numberOfSections() -> Int
    func item(atIndexPath indexPath: IndexPath) -> Codable?
    func updateItem(items: [Codable]) -> Void
    func fetchRequest() -> Void
}

extension GenericViewModel {
    
    func numberOfRows() -> Int {
        return items.count
    }
    
    func numberOfSections() -> Int {
        if items.count == 0 {
            return 0
        }
        
        return 1
    }
    
    func item(atIndexPath indexPath: IndexPath) -> Codable? {
        guard self.items.count > 0 else {
            return nil
        }

        return self.items[indexPath.row]
    }
}
