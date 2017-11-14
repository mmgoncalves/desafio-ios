//
//  RepositoryTableViewController+Delegate.swift
//  list-github-repository
//
//  Created by Mateus Marques on 13/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit
import SVProgressHUD

extension RepositoryTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        
        self.performSegue(withIdentifier: "showPullRequestsSegue", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let numberOfSections = tableView.numberOfSections - 1
        if let items = self.viewModel.fetchResultsController.sections?[numberOfSections].numberOfObjects {
            if indexPath.row == items - 1 {
                self.viewModel.fetchRepositories()
            }
        }
    }
    
    //MARK: ServiceDelegate
    func onFinish() {
        self.viewModel.initializeFetchResultsController()
        tableView.reloadData()
        self.dismissActivityIndicator()
    }
}
