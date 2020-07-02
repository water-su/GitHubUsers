//
//  UserListViewModel.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/2.
//  Copyright © 2020 water su. All rights reserved.
//

import RxSwift

class UserListViewModel: ListViewModelProtocol{
    
    private let titleText: String = "GitHub Users"
    
    var title: ReplaySubject<String> = ReplaySubject.create(bufferSize: 1)
    
    var items: [IconTitleStatusViewModelProtocol] = []
    
    private var users: [User] = []
    
    func fetchData() -> Observable<Bool> {
        
        APIManager.shared.getUserList()
            .map { (result) -> Bool in
                if let data = result.data as? [String: Any],
                    let array = data["array"] as? [[String: Any]]{
                    self.users = array.compactMap{ User(data: $0) }
                    self.items = self.users.map{ UserItemViewModel(user: $0) }
                    self.title.onNext( self.titleText + " (\(self.users.count))")
                    DebugUtil.log(level: .Info, domain: .API, message: "gor \(self.users.count) users")
                    return true
                }
                return false
        }
        
    }
    
}

