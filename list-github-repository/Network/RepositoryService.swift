//
//  RepositoryService.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Alamofire

struct RepositoryService: Service {
    func makeRequest(forRepository repository: Repository, completion: @escaping RequestResult) {}

    func makeRequest(
        withPage page: Int,
        completion: @escaping RequestResult)
    {
    
        Alamofire.request(Route.repository(withPage: page).get, method: .get)
            .validate()
            .responseJSON { (dataResponse) in

                guard dataResponse.result.isSuccess, let data = dataResponse.data else {
                    let msgError = dataResponse.result.error?.localizedDescription
                    let appError = RepositoryError.serviceResponse(localizedError: msgError ?? "")
                    let result = Result.error(appError)
                    
                    completion(result)
                    return
                }

                do {
                    let repositories = try JSONDecoder().decode(RepositoryItem.self, from: data)
                    let result = Result.success(items: repositories.items)
                    
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
