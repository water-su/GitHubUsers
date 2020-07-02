//
//  UserItemViewModel.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/2.
//  Copyright © 2020 water su. All rights reserved.
//

import UIKit

class UserItemViewModel: IconTitleStatusViewModelProtocol{
    
    var icon: String?
    
    var title: String?
    
    var status: (label: String, color: UIColor)?
    
    init(user: User) {
        self.icon = user.avatarUrl
        
        self.title = user.login
        
        if user.siteAdmin{
            status = ("staff", .blue)
        }
    }
    
}
