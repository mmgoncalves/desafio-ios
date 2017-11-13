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
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath) as? RepositoryTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
