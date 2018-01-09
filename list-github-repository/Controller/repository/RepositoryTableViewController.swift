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

class RepositoryTableViewController: UITableViewController, ServiceDelegate, NSFetchedResultsControllerDelegate {
    
    var viewModel: RepositoryViewModel!
    var managedObjectContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        self.startActivityIndicator(numberOfObjects: self.viewModel.numberOfObjects)
    }

    func setupViewModel() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.managedObjectContext = appDelegate?.persistentContainer.viewContext
        
        self.viewModel = RepositoryViewModel(context: self.managedObjectContext)
        self.viewModel.serviceDelegate = self
        self.viewModel.fetchResultControllerDelegate = self
        
        self.viewModel.initializeFetchResultsController()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else {
            print("Error to get selected row")
            return
        }
        
        guard let repository = self.viewModel.fetchResultsController.object(at: indexPath) as? RepositoryEntity else {
            print("Error to get repository")
            return
        }
        
        guard let destinationVC = segue.destination as? PullRequestTableViewController else {
            print("Error to get destionationViewController")
            return
        }
        
        destinationVC.managedObjectContext = self.managedObjectContext
        destinationVC.repository = repository
    }

}
