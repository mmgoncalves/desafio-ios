//
//  RepositoryTableViewController.swift
//  list-github-repository
//
//  Created by Mateus Marques on 11/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit
import CoreData
import SVProgressHUD

class RepositoryViewController: UIViewController, ServiceDelegate, NSFetchedResultsControllerDelegate, RepositoryViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: RepositoryViewModel!
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupTableViewDataSource()
        setupTableViewDelegate()
        
        self.startActivityIndicator(numberOfObjects: self.viewModel.numberOfRows())
    }

    func setupViewModel() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedObjectContext = appDelegate?.persistentContainer.viewContext
        
        self.viewModel = RepositoryViewModel(context: self.managedObjectContext)
        self.viewModel.serviceDelegate = self
        self.viewModel.fetchResultControllerDelegate = self
        
        self.viewModel.initializeFetchResultsController()
    }
    
    func setupTableViewDelegate() {
        let delegate = RepositoryDelegate(viewModel: viewModel, delegate: self)
        self.tableView.delegate = delegate
    }
    
    func setupTableViewDataSource() {
        let dataSource = RepositoryDataSource(viewModel: viewModel)
        self.tableView.dataSource = dataSource
    }
    
    //MARK: ServiceDelegate
    func onFinish() {
        self.viewModel.initializeFetchResultsController()
        self.tableView.reloadData()
        self.dismissActivityIndicator()
    }
    
    //MARK: RepositoryViewControllerDelegate
    func scrollEndOfTableView() {
        viewModel.fetchRequest()
        
        let ActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        ActivityIndicator.startAnimating()
        ActivityIndicator.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.tableView.bounds.width, height: CGFloat(44))
        self.tableView.tableFooterView = ActivityIndicator
        self.tableView.tableFooterView?.isHidden = false
    }
    
    func presentPullRequestViewController() {
        let destinationViewController = StoryboardScene.Main.pullRequestViewController.instantiate()
        navigationController?.pushViewController(destinationViewController, animated: true)
    }

}
