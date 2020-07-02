//
//  APIManager.swift
//  GitHubUsers
//
//  Created by water su on 2020/7/1.
//  Copyright © 2020 water su. All rights reserved.
//

import RxSwift
import RxAlamofire
import Alamofire

enum API {
    
    case userList(page: Int, size: Int)
    case user(name: String)
    
}
extension API {
    
    private static let base: String = "https://api.github.com"
    
    var path: String{
        switch self {
        case .userList(let page, let size):
            return API.base + "/users?page=\(page)&per_page=\(size)"
        case .user(let name):
            return API.base + "/users/\(name)"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .user,
             .userList:
            return .get
        }
    }
    
}
class APIManager: NSObject {
    
    private override init() {}

    static let shared = APIManager()
    
    struct Result {
        var sourceUrl: String
        var success: Bool
        var code: Int
        var response: HTTPURLResponse?
        var data: NSDictionary?
        var error : String?
        
        init(res: HTTPURLResponse, json: Any) {
            sourceUrl = res.url?.absoluteString ?? "unknown"
            success = (res.statusCode >= 200 && res.statusCode <= 299)
            code = res.statusCode
            
            response = res
            data = json as? NSDictionary
            if let respData = json as? NSDictionary{
                data = respData
            }else if let respArray = json as? NSArray{
                data = ["array": respArray]
            }
            
            // TODO: do basic error parsing here
        }
    }
    
    private func requestJSON(api: API, param: [String: Any]?) -> Observable<Result> {
        let network: SessionManager! = SessionManager.default
        return network.rx.responseJSON(api.method,
                                       api.path ,
                                       parameters: param,
                                       encoding: JSONEncoding.default,
                                       headers: nil)
            .map{ Result(res: $0.0, json: $0.1) }
    }
}
extension APIManager{
    func getUserList() -> Observable<Result>{
        return self.requestJSON(api: .userList(page: 0, size: 100), param: nil)
    }
}
