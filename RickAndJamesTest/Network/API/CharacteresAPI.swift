//
//  CharacteresAPI.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

enum CharacteresAPI {
    case list(page: Int)
}

extension CharacteresAPI: ServiceTargetProtocol {
    
    var baseURL: URL? {
        return URL(string: AppConfigurations.Server.url)
    }
    
    var path: String {
        switch self {
        case .list:
            return "/api/character"
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var parameters: [String : String] {
        switch self {
        case.list(let page):
            return ["page": String(page)]
        }
    }
}
