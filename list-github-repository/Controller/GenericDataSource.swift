//
//  GenericDataSource.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit

class GenericDataSource: NSObject, UITableViewDataSource {
    private var viewModel: GenericViewModel!
    
    init(viewModel: GenericViewModel) {
        self.viewModel = viewModel
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
