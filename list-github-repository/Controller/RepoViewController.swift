//
//  RepoViewController.swift
//  list-github-repository
//
//  Created by Mateus Marques on 13/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit
import SnapKit

extension UILabel {
    convenience init(test: String) {
        self.init()
        
        self.font = UIFont(name: "Avenir Next", size: 13)
    }
}

extension UIColor {
    
    var myBlue: UIColor {
            return UIColor(red: 91, green: 152, blue: 196, alpha: 1)
    }
    
    var myDarkGray: UIColor {
        return UIColor(red: 52, green: 52, blue: 57, alpha: 1)
    }
    
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

class RepoViewController: UIViewController, ServiceDelegate, RepositoryViewControllerDelegate {
    
//    private var viewModel: RepositoryViewModel?
    private var viewModel: TmpViewModel?
    private var tableViewDelegate: RepositoryDelegate?
    private var tableViewDataSource: RepositoryDataSource?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 350
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupTableViewDataSource()
        setupTableViewDelegate()
        
        navigationItem.title = "Repositories"
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
    }
    
    private func setupViewModel() {
//        self.viewModel = RepositoryViewModel()
        self.viewModel = TmpViewModel()
        self.viewModel?.serviceDelegate = self
        
        self.startActivityIndicator(numberOfObjects: (viewModel?.numberOfRows())!)
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
