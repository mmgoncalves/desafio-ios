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
    var full_name: String
    var stargazers_count: Int64
    var forks_count: Int64
    var description: String?
    var owner: JSONOwner
}
