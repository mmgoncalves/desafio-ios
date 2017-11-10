//
//  RepositoryService.swift
//  list-github-repository
//
//  Created by Mateus Marques on 10/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation
import CoreData
import Alamofire

struct RepositoryService {
 
    static func makeRequest(
        withPage page: Int16,
        context: NSManagedObjectContext,
        completion: @escaping (_ error: AppError?) -> Void)
    {
    
        Alamofire.request(Route.repository(withPage: page).get, method: .get)
            .validate()
            .responseJSON { (dataResponse) in
            
                guard dataResponse.result.isSuccess, let data = dataResponse.data else {
                    let error = dataResponse.error?.localizedDescription ?? ""
                    completion(RepositoryError.serviceResponse(localizedError: error))
                    return
                }
                
                do {
                    let jsonRepositoryItem = try JSONDecoder().decode(JSONRepositoryItem.self, from: data)
                    
                    RepositoryDAO.save(jsonRepositories: jsonRepositoryItem.items, page: page, inContext: context) { error in
                        if let error = error {
                            completion(RepositoryError.saveRepositories(localizedError: error.localizedDescription))
                        } else {
                            completion(nil)
                        }
                    }
                } catch {
                    print("Malformed data received from service")
                    completion(RepositoryError.serviceResponse(localizedError: error.localizedDescription))
                }
        }
    }
}
