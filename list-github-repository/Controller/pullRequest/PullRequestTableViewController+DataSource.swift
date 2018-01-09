//
//  PullRequestTableViewController+DataSource.swift
//  list-github-repository
//
//  Created by Mateus Marques on 13/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

extension PullRequestTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.fetchResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = self.viewModel.fetchResultsController.sections else {
            fatalError("FetchResultsController is empty")
        }
        
        return sections[section].numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PullRequestTableViewCell.reuseIdentifier, for: indexPath) as? PullRequestTableViewCell else {
            fatalError("Error to cast PullRequestTableViewCell")
        }
        
        guard let pullRequest = self.viewModel.fetchResultsController.object(at: indexPath) as? PullRequestEntity else {
            fatalError("FetchResultsController is empty")
        }
        
        cell.configure(pullRequest: pullRequest)
        return cell
    }
}
