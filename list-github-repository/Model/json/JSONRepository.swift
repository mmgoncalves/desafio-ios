//
//  JSONRepository.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct JSONRepository: Codable {
    var id: Int64
    var name: String
    var fullName: String
    var stars: Int64
    var forks: Int64
    var description: String?
    var owner: JSONOwner
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case forks = "forks_count"
        case stars = "stargazers_count"
        case id
        case name
        case description
        case owner
    }
}
