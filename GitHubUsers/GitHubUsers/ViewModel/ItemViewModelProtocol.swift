//
//  ItemViewModelProtocol.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/2.
//  Copyright © 2020 water su. All rights reserved.
//

import UIKit

protocol IconTitleStatusViewModelProtocol {

    var icon: String? {get}

    var title: String? {get}

    var status: (label: String, color: UIColor)? {get}

}
