//
//  RepositoryDataSource.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit

class RepositoryDataSource: NSObject, UITableViewDataSource {

    private var viewModel: GenericViewModel
    
    required init(viewModel: GenericViewModel) {
        self.viewModel = viewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let repository = viewModel.item(atIndexPath: indexPath) as? RepositoryEntity else {
            fatalError("Repository not found")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.reuseIdentifier, for: indexPath) as? RepositoryTableViewCell else {
            fatalError("The cell RepositoryTableViewCell sholud not be nil")
        }
        
        cell.configure(objectAssociated: repository)
        return cell
    }
}
