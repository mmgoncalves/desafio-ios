//
//  RepositoryTableViewController+DataSource.swift
//  list-github-repository
//
//  Created by Mateus Marques on 13/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

extension RepositoryTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryTableViewCell else {
            return UITableViewCell()
        }
        
        guard let repository = self.viewModel.repository(at: indexPath) else {
            fatalError("FetchResultsController is empty")
        }
        
        cell.configure(repository: repository)
        return cell
    }
}
