//
//  JSONPullRequest.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct PullRequest: Codable {
    var url: String
    var id: Int64
    var title: String
    var body: String?
    var createdAt: String
    var information: Head
    
    enum CodingKeys: String, CodingKey {
        case url = "html_url"
        case createdAt = "created_at"
        case information = "head"
        case id
        case title
        case body
    }
}
