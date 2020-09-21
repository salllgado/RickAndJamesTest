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
    case character(id: Int)
}

extension CharacteresAPI: ServiceTargetProtocol {
    
    var baseURL: URL? {
        return URL(string: "https://rickandmortyapi.com")
    }
    
    var path: String {
        switch self {
        case .list(_):
            return "/api/character"
        case .character(let id):
        return "/api/character/\(id)"
        }
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var parameters: [String : String] {
        switch self {
        case .list(let page):
            return ["page": String(page)]
        default:
            return [:]
        }
    }
}
