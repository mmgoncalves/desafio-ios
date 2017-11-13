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
        
        self.viewModel = PullRequestViewModel(repository: self.repository, context: self.managedObjectContext)

        self.viewModel.serviceDelegate = self
        self.viewModel.fetchResultsControllerDelegate = self
        
        self.viewModel.initializeFetchResultsController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
