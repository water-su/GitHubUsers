//
//  User.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/2.
//  Copyright © 2020 water su. All rights reserved.
//

import Foundation
/**
 [
   {
     "login": "octocat",
     "id": 1,
     "node_id": "MDQ6VXNlcjE=",
     "avatar_url": "https://github.com/images/error/octocat_happy.gif",
     "gravatar_id": "",
     "url": "https://api.github.com/users/octocat",
     "html_url": "https://github.com/octocat",
     "followers_url": "https://api.github.com/users/octocat/followers",
     "following_url": "https://api.github.com/users/octocat/following{/other_user}",
     "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
     "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
     "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
     "organizations_url": "https://api.github.com/users/octocat/orgs",
     "repos_url": "https://api.github.com/users/octocat/repos",
     "events_url": "https://api.github.com/users/octocat/events{/privacy}",
     "received_events_url": "https://api.github.com/users/octocat/received_events",
     "type": "User",
     "site_admin": false
   }
 ]
 */
struct User {
    var id: Int!
    var login: String?
    var avatarUrl: String?
    var siteAdmin: Bool = false
    
    init?(data: [String: Any]) {
        for key in data.keys{
            switch key {
            case "id":
                self.id = data[key] as? Int
            case "login":
                self.login = data[key] as? String
            case "avatar_url":
                self.avatarUrl = data[key] as? String
            case "site_admin":
                self.siteAdmin = data[key] as? Bool ?? false
            default:
                DebugUtil.log(level: .Info, domain: .API, message: "unused key \(key) in User data")
            }
        }
        if self.id == nil{
            return nil
        }
    }
}
