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
    
    var managedObjectContext: NSManagedObjectContext!
    var repository: RepositoryEntity!
    var viewModel: PullRequestViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        self.startActivityIndicator(numberOfObjects: self.viewModel.numberOfObjects)
    }

    func setupViewModel() {
        self.viewModel = PullRequestViewModel(repository: self.repository, context: self.managedObjectContext)
        
        self.viewModel.serviceDelegate = self
        self.viewModel.fetchResultControllerDelegate = self
        
        self.viewModel.initializeFetchResultsController()
    }
}
