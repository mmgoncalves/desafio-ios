//
//  RepositoryTableViewCell.swift
//  list-github-repository
//
//  Created by Mateus Marques on 12/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit
import SnapKit

class RepositoryTableViewCell: UITableViewCell, ReusableIdentifier, CellProtocol {
    
    typealias ObjectAssociated = Repository
    
//    @IBOutlet weak var avatar: UIImageView!
//    @IBOutlet weak var author: UILabel!
//    @IBOutlet weak var title: UILabel!
//    @IBOutlet weak var stars: UILabel!
//    @IBOutlet weak var forks: UILabel!
//    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = UIColor.darkGray
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.snp.makeConstraints { (make) in
            make.height.equalTo(160)
        }
        
    }

    func configure(objectAssociated: ObjectAssociated) -> Void {
        let repository = objectAssociated
        
        self.authorLabel.text = repository.owner.login
        self.titleLabel.text = repository.name
        self.bodyLabel.text = repository.body
        self.numberOfStarsLabel.text = String(repository.stars)
        self.numberOfForksLabel.text = String(repository.forks)
        self.avatar.downloadImage(byString: repository.owner.avatarUrl)
    }
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addSubview(row1StackView)
        stackView.addSubview(row2StackView)
        return stackView
    }()
    
    lazy var row1StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addSubview(avatar)
        stackView.addSubview(titleBodyStackView)
        return stackView
    }()
    
    lazy var avatar: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var titleBodyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addSubview(titleLabel)
        stackView.addSubview(bodyLabel)
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(hex: "5B98C4")
        
        return title
    }()
    
    lazy var bodyLabel: UILabel = {
        let body = UILabel()
        return body
    }()
    
    lazy var row2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addSubview(authorLabel)
        stackView.addSubview(starStackView)
        stackView.addSubview(forkStackView)
        return stackView
    }()
    
    lazy var authorLabel: UILabel = {
        let author = UILabel()
        return author
    }()
    
    lazy var starStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addSubview(starIcon)
        stackView.addSubview(numberOfStarsLabel)
        return stackView
    }()
    
    lazy var forkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.addSubview(forkIcon)
        stackView.addSubview(numberOfForksLabel)
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
}
