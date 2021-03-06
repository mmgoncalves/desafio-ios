//
//  PullRequestTableViewCell.swift
//  list-github-repository
//
//  Created by Mateus Marques on 12/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: UITableViewCell, ReusableIdentifier, CellProtocol {
    
    typealias ObjectAssociated = PullRequest
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(objectAssociated: ObjectAssociated) -> Void {
        let pullRequest = objectAssociated

        self.author.text = pullRequest.information.owner.login
        self.title.text = pullRequest.title
        self.body.text = pullRequest.body
        self.avatar.downloadImage(byString: pullRequest.information.owner.avatarUrl)
        
        if let date = Date.from(dateString: pullRequest.createdAt) {
            self.date.text = date.shortDate
        }
    }
}
