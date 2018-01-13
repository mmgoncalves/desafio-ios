//
//  RepoViewController.swift
//  list-github-repository
//
//  Created by Mateus Marques on 13/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import UIKit
import SnapKit

class RepoViewController: UIViewController {
    
    lazy var RepoCell: RepositoryTableViewCell = {
        let cell = RepositoryTableViewCell()
        return cell
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.reuseIdentifier)
        return tableView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var row1StackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var avatar: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var titleBodyStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        return title
    }()
    
    lazy var bodyLabel: UILabel = {
        let body = UILabel()
        return body
    }()
    
    lazy var row2StackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        return author
    }()
    
    lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var forkStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var starIcon: UIImageView = {
        let star = UIImageView()
        return star
    }()
    
    lazy var numberOfStarsLabel: UILabel = {
        let stars = UILabel()
        return stars
    }()
    
    lazy var forkIcon: UIImageView = {
        let fork = UIImageView()
        return fork
    }()
    
    lazy var numberOfForksLabel: UILabel = {
        let forks = UILabel()
        return forks
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Repositories"
        navigationController?.navigationBar.barStyle = .black
        
        
    }

}
