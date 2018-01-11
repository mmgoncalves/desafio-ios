//
//  PullRequestService.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Alamofire

struct PullRequestService {
    
    static func makeRequest(
        forRepository repository: Repository,
        completion: @escaping (_ result: Result) -> Void)
    {
        
        Alamofire.request(Route.pullRequests(projectName: repository.fullName).get, method: .get)
            .validate()
            .responseJSON { (dataResponse) in
            
                guard dataResponse.result.isSuccess, let data = dataResponse.data else {
                    let msgError = dataResponse.error?.localizedDescription
                    let appError = RepositoryError.serviceResponse(localizedError: msgError ?? "")
                    let result = Result.error(appError)
                    
                    completion(result)
                    return
                }
                
                do {
                    let items = try JSONDecoder().decode([PullRequest].self, from: data)
                    let result = Result.success(items: items)
                    
                    completion(result)
                    
                } catch {
                    print("Malformed data received from service")
                    let appError = RepositoryError.parseToObject
                    let result = Result.error(appError)
                    
                    completion(result)
                }
        }
    }
}
