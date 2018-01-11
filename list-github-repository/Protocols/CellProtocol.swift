//
//  CellProtocol.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/01/18.
//  Copyright © 2018 Mateus Marques. All rights reserved.
//

import Foundation

protocol CellProtocol {
    associatedtype ObjectAssociated
    
    func configure(objectAssociated: ObjectAssociated) -> Void
}
