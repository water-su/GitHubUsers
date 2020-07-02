//
//  DebugUtil.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/2.
//  Copyright © 2020 water su. All rights reserved.
//

import UIKit

class DebugUtil: NSObject {
    
    enum Level : String{
        case Info
        case Warning
        case Error
    }
    enum Domain : String{
        case API
        case UI
    }
    static func log(level: Level, domain: Domain, message: String){
        let msg = "\(level.rawValue):[\(domain)]-\(message)"
        print("\(msg)")
        // TODO: also send to fabric
    }
    
}
