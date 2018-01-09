//
//  RepositoryTableViewCell.swift
//  list-github-repository
//
//  Created by Mateus Marques on 12/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell, ReusableIdentifier {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var stars: UILabel!
    @IBOutlet weak var forks: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(repository:RepositoryEntity) {
        self.author.text = repository.owner?.login
        self.title.text = repository.name
        self.body.text = repository.body
        self.stars.text = String(repository.stars)
        self.forks.text = String(repository.forks)
        self.avatar.downloadImage(byString: repository.owner?.avatar)
    }
}
