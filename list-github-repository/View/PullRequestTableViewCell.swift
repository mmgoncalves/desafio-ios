//
//  PullRequestTableViewCell.swift
//  list-github-repository
//
//  Created by Mateus Marques on 12/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit
import Kingfisher

class PullRequestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(pullRequest: PullRequestEntity) {
        self.author.text = pullRequest.owner?.login
        self.title.text = pullRequest.title
        self.body.text = pullRequest.body
        self.date.text = pullRequest.createdAt?.shortDate
        
        if let imageString = pullRequest.owner?.avatar {
            let url = URL(string: imageString)
            self.avatar.kf.setImage(with: url)
        }
    }
}
