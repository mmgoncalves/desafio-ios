//
//  PullRequestTableViewController.swift
//  list-github-repository
//
//  Created by Mateus Marques on 11/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class PullRequestViewController: UIViewController, ServiceDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var repository: Repository?
    var viewModel: PullRequestViewModel?
    
    private var tableViewDelegate: PullRequestDelegate?
    private var tableViewDataSource: PullRequestDataSource?
    
    
//    init?(managedObjectContext: NSManagedObjectContext, repository: Repository) {
//
//        self.managedObjectContext = managedObjectContext
//        self.repository = repository
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupDataSource()
        setupDelegate()
    }
    
    private func setupViewModel() {
        self.viewModel = PullRequestViewModel(repository: repository!, serviceDelegate: self)
        
        self.startActivityIndicator(numberOfObjects: (self.viewModel?.numberOfRows())!)
    }

    private func setupDataSource() {
        self.tableViewDataSource = PullRequestDataSource(viewModel: self.viewModel!)
        self.tableView.dataSource = self.tableViewDataSource
    }
    
    private func setupDelegate() {
        self.tableViewDelegate = PullRequestDelegate(viewModel: self.viewModel!)
        self.tableView.delegate = self.tableViewDelegate
    }
    
    //MARK: ServiceDelegate
    func requestSuccess(items: [Codable]) -> Void {
        viewModel?.updateItem(items: items)
        tableView.reloadData()
        self.dismissActivityIndicator()
    }
    
    func requestFailed(error: AppError) -> Void {
        self.showMessage(by: error)
    }
}
