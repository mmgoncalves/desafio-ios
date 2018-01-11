//
//  Route.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

enum Result {
    case success(items: [Codable])
    case error(AppError)
}

enum Route {
    case repository(withPage: Int)
    case pullRequests(projectName: String)
    
    var get: String {
        switch self {
        case .repository(let page):
            return "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=\(page)"
        case .pullRequests(let projectName):
            return "https://api.github.com/repos/\(projectName)/pulls"
        }
    }
}
