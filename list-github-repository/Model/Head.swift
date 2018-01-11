//
//  JSONHead.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct Head: Codable {
    var owner: Owner
    var repository: Repository
    
    enum CodingKeys: String, CodingKey {
        case owner = "user"
        case repository = "repo"
    }
}
