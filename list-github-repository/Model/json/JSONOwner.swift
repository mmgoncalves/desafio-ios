//
//  JSONOwner.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct JSONOwner: Codable {
    var login: String
    var id: Int64
    var avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case login
        case id
    }
}
