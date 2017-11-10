//
//  StubJSONPullRequest.swift
//  list-github-repository
//
//  Created by Mateus Marques on 09/11/17.
//  Copyright © 2017 Mateus Marques. All rights reserved.
//

import Foundation

struct StubJSONPullRequest {
    static func getData() -> Data {
        let jsonString = "[{\"url\": \"https://api.github.com/repos/ReactiveX/RxJava/pulls/5710\",\"id\": 151358944,\"title\": \"1.x: Single.subscribe should not crash onSuccess into onError\",\"body\": \"Fix `Single.subscribe(Action1, Action1)` to not call `onError` if the `onSuccess` action crashes, ensuring that the `Single` protocol `onSuccess|onError` is maintained. Crashes will go into the `RxJavaHooks.onError` handler.\r\n\r\nFixes: #5237.\",\"created_at\": \"2017-11-08T11:35:56Z\",\"head\": {\"user\": {\"login\": \"akarnokd\",\"id\": 1269832,\"avatar_url\": \"https://avatars2.githubusercontent.com/u/1269832?v=4\"},\"repo\": {\"id\": 14518033,\"name\": \"RxJava\",\"full_name\": \"akarnokd/RxJava\",\"owner\": {\"login\": \"akarnokd\",\"id\": 1269832,\"avatar_url\": \"https://avatars2.githubusercontent.com/u/1269832?v=4\"},\"stargazers_count\": 3,\"forks_count\": 1}}}]"
        
        return jsonString.data(using: .utf8)!
    }
}
