//
//  PullRequestService.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData
import Alamofire

struct PullRequestService {
    
    static func makeRequest(
        forRepository repository: RepositoryEntity,
        context: NSManagedObjectContext,
        completion: @escaping (_ error: AppError?) -> Void)
    {
        
        guard let projectName = repository.fullName else {
            print("Repository fullName should not be nil")
            return
        }
        
        
        Alamofire.request(Route.pullRequests(projectName: projectName).get, method: .get)
            .validate()
            .responseJSON { (dataResponse) in
            
                guard dataResponse.result.isSuccess, let data = dataResponse.data else {
                    let error = dataResponse.error?.localizedDescription ?? ""
                    completion(PullRequestError.serviceResponse(localizedError: error))
                    return
                }
                
                do {
                    let jsonPullRequests = try JSONDecoder().decode([JSONPullRequest].self, from: data)
                    
                    PullRequestDAO.save(jsonPullRequests: jsonPullRequests, repositoryId: repository.id, inContext: context) { error in
                        if let error = error {
                            completion(PullRequestError.save(localizedError: error.localizedDescription))
                        } else {
                            completion(nil)
                        }
                    }
                } catch {
                    print("Malformed data received from service")
                    completion(PullRequestError.save(localizedError: error.localizedDescription))
                }
        }
    }
}
