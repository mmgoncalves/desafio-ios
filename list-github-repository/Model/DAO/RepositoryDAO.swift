//
//  RepositoryDAO.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData

struct RepositoryDAO {
    
    static func save(jsonRepositories: [JSONRepository], page: Int16, inContext: NSManagedObjectContext, completion: @escaping (_ error: Error?) -> Void) {
        
        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        privateContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        privateContext.parent = inContext
        
        privateContext.performAndWait {
            for jsonRepository in jsonRepositories {
                
                let repository      = RepositoryEntity(context: privateContext)
                let owner           = OwnerEntity(context: privateContext)
                
                owner.id            = jsonRepository.owner.id
                owner.login         = jsonRepository.owner.login
                owner.avatar        = jsonRepository.owner.avatar_url
                
                repository.id       = jsonRepository.id
                repository.page     = page
                repository.name     = jsonRepository.name
                repository.owner    = owner
                repository.forks    = jsonRepository.forks_count
                repository.stars    = jsonRepository.stargazers_count
                repository.fullName = jsonRepository.full_name
            }
            
            privateContext.saveSync(completion: { (error) in
                completion(error)
            })
        }
    }
    
    static func all(inContext: NSManagedObjectContext) -> [RepositoryEntity]? {
        
        let fethRequest: NSFetchRequest<RepositoryEntity> = RepositoryEntity.fetchRequest()
        
        do {
            let repositories = try inContext.fetch(fethRequest) as [RepositoryEntity]
            return repositories
        } catch {
            print("Error to fetch all repositories. Error description: \(error.localizedDescription)")
            return nil
        }
    }
}
