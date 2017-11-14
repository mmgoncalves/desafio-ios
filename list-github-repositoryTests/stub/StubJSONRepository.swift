//
//  StubJSONRepository.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import CoreData
@testable import list_github_repository

struct StubJSONRepository {
    static func getData() -> Data {
        let jsonString = "{\"items\": [{\"id\": 7508411,\"name\": \"RxJava\",\"full_name\": \"ReactiveX/RxJava\",\"description\":\"RxJava – Reactive Extensions for the JVM – a library for composing asynchronous and event-based programs using observable sequences for the Java VM.\",\"owner\": {\"login\": \"ReactiveX\",\"id\": 6407041,\"avatar_url\": \"https://avatars1.githubusercontent.com/u/6407041?v=4\"},\"stargazers_count\": 28539,\"forks_count\": 5026}]}"
        
        return jsonString.data(using: .utf8)!
    }
    
    static func getRepositories() -> [JSONRepository] {
        let jsonData = StubJSONRepository.getData()
        
        do {
            let jsonRepositoryItem = try JSONDecoder().decode(JSONRepositoryItem.self, from: jsonData)
            return jsonRepositoryItem.items
        } catch {
            fatalError("Parse json to object failed. Error: \(error)")
        }
    }
    
}
