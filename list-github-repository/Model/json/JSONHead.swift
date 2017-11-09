//
//  JSONHead.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct JSONHead: Codable {
    var user: JSONOwner
    var repo: JSONRepository
}
