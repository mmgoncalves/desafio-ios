//
//  PullRequestTableViewCell.swift
//  list-github-repository
//
//  Created by Mateus Marques on 12/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell, ReusableIdentifier {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(pullRequest: PullRequestEntity) {
        self.author.text = pullRequest.owner?.login
        self.title.text = pullRequest.title
        self.body.text = pullRequest.body
        self.date.text = pullRequest.createdAt?.shortDate
        self.avatar.downloadImage(byString: pullRequest.owner?.avatar)
    }
}
