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
                owner.avatar        = jsonRepository.owner.avatarUrl
                
                repository.id       = jsonRepository.id
                repository.page     = page
                repository.name     = jsonRepository.name
                repository.body     = jsonRepository.description
                repository.owner    = owner
                repository.forks    = jsonRepository.forks
                repository.stars    = jsonRepository.stars
                repository.fullName = jsonRepository.fullName
            }
            
            privateContext.saveSync(completion: { (error) in
                if let error = error {
                    completion(RepositoryError.saveRepositories(localizedError: error.localizedDescription))
                } else {
                    completion(error)
                }
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
    
    static func findOne(byId id: Int64, inContext: NSManagedObjectContext) -> RepositoryEntity? {
        let fetchRequest: NSFetchRequest<RepositoryEntity> = RepositoryEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [id])
        
        do {
            let repositories = try inContext.fetch(fetchRequest) as [RepositoryEntity]
            return repositories.first
        } catch {
            print("Error to fetch repository by id. Error description: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func fetchRequestDefault() -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = RepositoryEntity.fetchRequest()
        let sortByStars = NSSortDescriptor(key: "stars", ascending: false)
        let sortByPage = NSSortDescriptor(key: "page", ascending: true)
        
        fetchRequest.sortDescriptors = [sortByStars, sortByPage]
        
        return fetchRequest
    }
    
    static func getLastPage(inContext: NSManagedObjectContext) -> Int16 {
        let fetchRequest = RepositoryDAO.fetchRequestDefault()
        
        do {
            let repositories = try inContext.fetch(fetchRequest) as! [RepositoryEntity]
            return repositories.last?.page ?? 1
        } catch {
            return 1
        }
    }
}
