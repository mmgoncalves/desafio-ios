//
//  PullRequestDAO.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

struct PullRequestDAO {
    
    static func save(
        jsonPullRequests: [JSONPullRequest],
        repositoryId: Int64,
        inContext: NSManagedObjectContext,
        completion: @escaping (_ error: AppError?) -> Void)
    {
        
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        privateContext.parent = inContext
        
        privateContext.performAndWait {
            
            guard let repository = RepositoryDAO.findOne(byId: repositoryId, inContext: privateContext) else {
                completion(PullRequestError.findRepository)
                return
            }
            
            for jsonPR in jsonPullRequests {
                
                let pullRequest     = PullRequestEntity(context: privateContext)
                let owner           = OwnerEntity(context: privateContext)
                
                owner.id            = jsonPR.head.user.id
                owner.login         = jsonPR.head.user.login
                owner.avatar        = jsonPR.head.user.avatar_url
                
                pullRequest.id      = jsonPR.id
                pullRequest.url     = jsonPR.url
                pullRequest.body    = jsonPR.body
                pullRequest.title   = jsonPR.title
                pullRequest.owner   = owner
                pullRequest.repository    = repository
                
                if let date = Date.from(dateString: jsonPR.created_at) {
                    pullRequest.createdAt = date as NSDate
                }
            }
            
            privateContext.saveSync(completion: { (error) in
                if let error = error {
                    completion(PullRequestError.save(localizedError: error.localizedDescription))
                } else {
                    completion(nil)
                }
            })
        }
    }
    
    static func find(byRepositoryId repositoryId: Int64, inContext: NSManagedObjectContext) -> [PullRequestEntity]? {
        let fetchRequest: NSFetchRequest<PullRequestEntity> = PullRequestEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "repository.id = %@", argumentArray: [repositoryId])
        
        do {
            let pullRequests = try inContext.fetch(fetchRequest) as [PullRequestEntity]
            return pullRequests
        } catch {
            print("Error to fetch pullRequest by repositoryId. Error description: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func all(inContext: NSManagedObjectContext) -> [PullRequestEntity]? {
        let fetchRequest: NSFetchRequest<PullRequestEntity> = PullRequestEntity.fetchRequest()
        
        do {
            let pullRequests = try inContext.fetch(fetchRequest) as [PullRequestEntity]
            return pullRequests
        } catch {
            print("Error to fetch all pullRequests. Error description: \(error.localizedDescription)")
            return nil
        }
    }
}
