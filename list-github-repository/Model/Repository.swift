//
//  JSONRepository.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct Repository: Codable {
    var id: Int64
    var name: String
    var fullName: String
    var stars: Int64
    var forks: Int64
    var body: String?
    var owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case forks = "forks_count"
        case stars = "stargazers_count"
        case body = "description"
        case id
        case name
        case owner
    }
}
