//
//  JSONPullRequest.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct JSONPullRequest: Codable {
    var html_url: String
    var id: Int64
    var title: String
    var body: String?
    var created_at: String
    var head: JSONHead
}
