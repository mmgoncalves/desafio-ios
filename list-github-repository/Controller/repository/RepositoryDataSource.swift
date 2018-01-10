//
//  RepositoryDataSource.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit

class RepositoryDataSource: GenericDataSource {

    private var viewModel: GenericViewModel!
    
    required override init(viewModel: GenericViewModel) {
        self.viewModel = viewModel
        
        super.init(viewModel: viewModel)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let repository = viewModel.getRepository(atIndexPath: indexPath) else {
            fatalError("Repository not found")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.reuseIdentifier, for: indexPath) as? RepositoryTableViewCell else {
            fatalError("The cell RepositoryTableViewCell sholud not be nil")
        }
        
        cell.configure(objectAssociated: repository)
        return cell
    }
}
