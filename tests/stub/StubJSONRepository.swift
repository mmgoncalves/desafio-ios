//
//  StubJSONRepository.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct StubJSONRepository {
    static func getData() -> Data {
        let jsonString = "{\"items\": [{\"id\": 7508411,\"name\": \"RxJava\",\"full_name\": \"ReactiveX/RxJava\",\"owner\": {\"login\": \"ReactiveX\",\"id\": 6407041,\"avatar_url\": \"https://avatars1.githubusercontent.com/u/6407041?v=4\"},\"stargazers_count\": 28539,\"forks_count\": 5026}]}"
        
        return jsonString.data(using: .utf8)!
    }
}
