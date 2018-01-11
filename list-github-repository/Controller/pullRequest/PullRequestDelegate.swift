//
//  PullRequestDelegate.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 10/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit

class PullRequestDelegate: NSObject, UITableViewDelegate {
    
    private let viewModel: GenericViewModel
    
    init(viewModel: GenericViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pullRequest = viewModel.item(atIndexPath: indexPath) as? PullRequest, let url = URL(string: pullRequest.url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
