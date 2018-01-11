//
//  ServiceDelegate.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

protocol ServiceDelegate {
    // improve to return Result<T>
    func requestSuccess(items: [Codable]) -> Void
    func requestFailed(error: AppError) -> Void
}
