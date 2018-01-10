//
//  PullRequestTableViewController.swift
//  list-github-repository
//
//  Created by Mateus Marques on 11/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit
import CoreData

class PullRequestTableViewController: UITableViewController, ServiceDelegate, NSFetchedResultsControllerDelegate {
    
    private var managedObjectContext: NSManagedObjectContext
    private var repository: RepositoryEntity
    
    var viewModel: PullRequestViewModel!
    
    required init?(managedObjectContext: NSManagedObjectContext, repository: RepositoryEntity) {
        self.managedObjectContext = managedObjectContext
        self.repository = repository
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupDataSource()
        setupDelegate()
        
        self.startActivityIndicator(numberOfObjects: self.viewModel.numberOfRows())
    }

    private func setupDataSource() {
        let dataSource = PullRequestDataSource(viewModel: self.viewModel)
        self.tableView.dataSource = dataSource
    }
    
    private func setupDelegate() {
        let delegate = PullRequestDelegate(viewModel: self.viewModel)
        self.tableView.delegate = delegate
    }
    
    private func setupViewModel() {
        self.viewModel = PullRequestViewModel(repository: self.repository, context: self.managedObjectContext)
        
        self.viewModel.serviceDelegate = self
        self.viewModel.fetchResultControllerDelegate = self
        
        self.viewModel.initializeFetchResultsController()
    }
    
    //MARK: ServiceDelegate
    func onFinish() {
        self.viewModel.initializeFetchResultsController()
        tableView.reloadData()
        self.dismissActivityIndicator()
    }
}
