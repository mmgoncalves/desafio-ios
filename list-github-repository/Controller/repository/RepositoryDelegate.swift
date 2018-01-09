//
//  RepositoryDelegate.swift
//  list-github-repository
//
//  Created by Mateus Gonçalves on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit
import SVProgressHUD

class RepositoryDelegate: NSObject, UITableViewDelegate {
    
    private let viewModel: GenericViewModel!
    let tableView: UITableView!
    
    init(viewModel: GenericViewModel, tableView: UITableView) {
        self.viewModel = viewModel
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none

//        self.performSegue(withIdentifier: "showPullRequestsSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let items = viewModel.numberOfRows()
        if indexPath.row == items - 1 {
            setFooterActivityIndicator()
            viewModel.fetchRequest()
        }
    }
    
    private func setFooterActivityIndicator() {
        let ActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        ActivityIndicator.startAnimating()
        ActivityIndicator.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.tableView.bounds.width, height: CGFloat(44))
        self.tableView.tableFooterView = ActivityIndicator
        self.tableView.tableFooterView?.isHidden = false
    }
}
