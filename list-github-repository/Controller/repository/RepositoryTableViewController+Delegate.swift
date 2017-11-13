//
//  RepositoryTableViewController+Delegate.swift
//  list-github-repository
//
//  Created by Mateus Marques on 13/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

extension RepositoryTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
    }
    
    //MARK: ServiceDelegate
    func onFinish() {
        tableView.reloadData()
    }
}
