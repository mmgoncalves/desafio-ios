//
//  RepositoryDataSource.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit

class RepositoryDataSource: NSObject, UITableViewDataSource {

    private let viewModel: GenericViewModel!
    
    required init(viewModel: GenericViewModel) {
        self.viewModel = viewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let repository = viewModel.getRepository(atIndexPath: indexPath) else {
            fatalError("Repository not found")
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryTableViewCell {
            cell.configure(repository: repository)
            return cell
        }
        
        return UITableViewCell()
    }
}
