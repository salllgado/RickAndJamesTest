//
//  MainService.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

struct InfoResult: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct CharacterLocationResult: Decodable {
    let name: String
}

struct CharacterResult: Decodable {
    let id: Int
    let name: String
    let status: String // alive
    let species: String // Human
    let gender: String
    let image: String
    let location: CharacterLocationResult
}

struct CharacteresResult: Decodable {
    let info: InfoResult
    let character: [CharacterResult]
    
    enum CodingKeys: String, CodingKey {
        case info
        case character = "results"
    }
}

class MainService: ServiceProvider {
    func getCharacteres(page: Int = 1, completion: @escaping (Result<CharacteresResult, NetworkError>)->Void) {
        request(target: CharacteresAPI.list(page: page), completion: completion)
    }
}
