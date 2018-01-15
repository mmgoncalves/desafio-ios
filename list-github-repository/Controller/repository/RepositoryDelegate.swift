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
    
    private let viewModel: GenericViewModel
    private let delegate: RepositoryViewControllerDelegate
    
    init(viewModel: GenericViewModel, delegate: RepositoryViewControllerDelegate) {
        self.viewModel = viewModel
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        self.delegate.selectedItem(atIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let items = viewModel.numberOfRows()
        if indexPath.row == items - 1 {
            self.delegate.scrolledToTheEndOfTableView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}
