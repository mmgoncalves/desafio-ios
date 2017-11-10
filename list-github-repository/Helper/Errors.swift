//
//  Errors.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

protocol AppError: LocalizedError {
    var title: String {get}
}

enum RepositoryError: AppError {
    
    case parseToObject
    case saveRepositories(localizedError: String)
    
    var title: String {
        switch self {
        case .parseToObject:
            return "Error"
        case .saveRepositories:
            return "Error while saving"
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .parseToObject:
            return "Error to parse data to object"
        case .saveRepositories(let localizedError):
            return "Error description: \(localizedError)"
        }
    }
}

enum PullRequestError: AppError {
    case parseToObject
    case findRepository
    case save(localizedError: String)
    
    var title: String {
        switch self {
        case .parseToObject, .save:
            return "Error"
        case .findRepository:
            return "Repository not found"
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .parseToObject:
            return "Error to try parse data to object"
        case .save(let localizedError):
            return "Error description: \(localizedError)"
        case .findRepository:
            return "Error to get repository."
        }
    }
}
