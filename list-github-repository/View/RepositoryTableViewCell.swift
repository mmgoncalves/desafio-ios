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
        
//        contentView.backgroundColor = UIColor.yellow
//        contentView.snp.makeConstraints { (make) in
//            make.height.equalTo(160)
//            make.trailing.equalToSuperview()
//            make.leading.equalToSuperview()
//        }
        
        self.addSubview(mainStackView)

        mainStackView.snp.makeConstraints { (make) in
            make.trailing.equalTo(contentView)
            make.leading.equalTo(contentView).offset(20)
            make.top.equalTo(contentView).offset(20)
            make.bottom.equalTo(contentView).offset(20)
        }
        
        row1StackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        avatar.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleBodyStackView.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(21)
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
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.addSubview(row1StackView)
//        stackView.addSubview(row2StackView)
        return stackView
    }()
    
    lazy var row1StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 20
        stackView.addSubview(avatar)
        stackView.addSubview(titleBodyStackView)
        return stackView
    }()
    
    lazy var avatar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 40
        image.layer.masksToBounds = true
        return image
    }()
    
    lazy var titleBodyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addSubview(titleLabel)
        stackView.addSubview(bodyLabel)
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = UIColor(hex: "5B98C4")
        title.text = "Title"
        
        return title
    }()
    
    lazy var bodyLabel: UILabel = {
        let body = UILabel()
        body.text = "Body"
        return body
    }()
    
    lazy var row2StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
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
        stackView.axis = .horizontal
        stackView.addSubview(starIcon)
        stackView.addSubview(numberOfStarsLabel)
        return stackView
    }()
    
    lazy var forkStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
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
