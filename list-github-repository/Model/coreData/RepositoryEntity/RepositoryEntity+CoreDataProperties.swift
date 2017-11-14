//
//  RepositoryEntity+CoreDataProperties.swift
//  
//
//  Created by Mateus Marques on 13/11/17.
//
//

import Foundation
import CoreData


extension RepositoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepositoryEntity> {
        return NSFetchRequest<RepositoryEntity>(entityName: "RepositoryEntity")
    }

    @NSManaged public var forks: Int64
    @NSManaged public var fullName: String?
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var page: Int16
    @NSManaged public var stars: Int64
    @NSManaged public var body: String?
    @NSManaged public var owner: OwnerEntity?
    @NSManaged public var pullRequests: NSSet?

}

// MARK: Generated accessors for pullRequests
extension RepositoryEntity {

    @objc(addPullRequestsObject:)
    @NSManaged public func addToPullRequests(_ value: PullRequestEntity)

    @objc(removePullRequestsObject:)
    @NSManaged public func removeFromPullRequests(_ value: PullRequestEntity)

    @objc(addPullRequests:)
    @NSManaged public func addToPullRequests(_ values: NSSet)

    @objc(removePullRequests:)
    @NSManaged public func removeFromPullRequests(_ values: NSSet)

}
