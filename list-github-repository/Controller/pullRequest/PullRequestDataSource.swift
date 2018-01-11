//
//  PullRequestDataSource.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 10/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit

class PullRequestDataSource: NSObject, UITableViewDataSource {
    
    private var viewModel: GenericViewModel
    
    required init(viewModel: GenericViewModel) {
        self.viewModel = viewModel
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PullRequestTableViewCell.reuseIdentifier, for: indexPath) as? PullRequestTableViewCell else {
            fatalError("Error to cast PullRequestTableViewCell")
        }
        
        guard let pullRequest = viewModel.item(atIndexPath: indexPath) as? PullRequest else{
            fatalError("FetchResultsController is empty")
        }
        
        cell.configure(objectAssociated: pullRequest)
        return cell
    }
}
