//
//  ListViewModelProtocol.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/2.
//  Copyright © 2020 water su. All rights reserved.
//

import UIKit
import RxSwift

protocol ListViewModelProtocol {
    
    var title: ReplaySubject<String> { get }
    
    var items : [IconTitleStatusViewModelProtocol] { get }
    
    func fetchData() -> Observable<Bool>

}
