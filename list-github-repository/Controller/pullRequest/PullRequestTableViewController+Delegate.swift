//
//  PullRequestTableViewController+Delegate.swift
//  list-github-repository
//
//  Created by Mateus Marques on 13/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

extension PullRequestTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let pullRequest = self.viewModel.fetchResultsController.object(at: indexPath) as? PullRequestEntity,
            let url = URL(string: pullRequest.url)
        {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    //MARK: ServiceDelegate
    func onFinish() {
        self.viewModel.initializeFetchResultsController()
        tableView.reloadData()
    }
}
