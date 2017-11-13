//
//  OwnerEntity+CoreDataProperties.swift
//  
//
//  Created by Mateus Marques on 13/11/17.
//
//

import Foundation
import CoreData


extension OwnerEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OwnerEntity> {
        return NSFetchRequest<OwnerEntity>(entityName: "OwnerEntity")
    }

    @NSManaged public var avatar: String?
    @NSManaged public var id: Int64
    @NSManaged public var login: String?
    @NSManaged public var repository: RepositoryEntity?
    @NSManaged public var pullRequest: PullRequestEntity?

}
