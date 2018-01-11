//
//  RepositoryViewControllerDelegate.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 10/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation

protocol RepositoryViewControllerDelegate {
    func scrolledToTheEndOfTableView() -> Void
    func selectedItem(atIndexPath: IndexPath) -> Void
}
