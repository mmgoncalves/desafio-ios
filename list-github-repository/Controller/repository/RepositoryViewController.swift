//
//  RepositoryTableViewController.swift
//  list-github-repository
//
//  Created by Mateus Marques on 11/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class RepositoryViewController: UIViewController, ServiceDelegate, RepositoryViewControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: RepositoryViewModel?
    private var tableViewDelegate: RepositoryDelegate?
    private var tableViewDataSource: RepositoryDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupTableViewDataSource()
        setupTableViewDelegate()
    }

    private func setupViewModel() {
        let service = RepositoryService()
        self.viewModel = RepositoryViewModel(service: service, serviceDelegate: self)
        
        self.startActivityIndicator(numberOfObjects: (self.viewModel?.numberOfRows())!)
    }
    
    private func setupTableViewDelegate() {
        self.tableViewDelegate = RepositoryDelegate(viewModel: viewModel!, delegate: self)
        self.tableView.delegate = self.tableViewDelegate
    }
    
    private func setupTableViewDataSource() {
        self.tableViewDataSource = RepositoryDataSource(viewModel: viewModel!)
        self.tableView.dataSource = self.tableViewDataSource
    }
    
    //MARK: ServiceDelegate
    func requestSuccess(items: [Codable]) -> Void {
        viewModel?.updateItem(items: items)
        self.tableView.reloadData()
        self.dismissActivityIndicator()
    }
    
    func requestFailed(error: AppError) -> Void {
        self.showMessage(by: error)
    }
    
    //MARK: RepositoryViewControllerDelegate
    func scrolledToTheEndOfTableView() {
        viewModel?.fetchRequest()
        
        let ActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        ActivityIndicator.startAnimating()
        ActivityIndicator.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.tableView.bounds.width, height: CGFloat(44))
        self.tableView.tableFooterView = ActivityIndicator
        self.tableView.tableFooterView?.isHidden = false
    }
    
    func selectedItem(atIndexPath: IndexPath) {
        guard let repository = viewModel?.item(atIndexPath: atIndexPath) as? Repository else {
            self.showMessage(by: GenericError.cellNotSelected)
            return
        }
        
        let destinationViewController = StoryboardScene.Main.pullRequestViewController.instantiate()
        
        destinationViewController.repository = repository
        
        navigationController?.pushViewController(destinationViewController, animated: true)
    }

}
