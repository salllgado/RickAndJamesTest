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

protocol MainServiceProvider: class {
    func getCharacteres(page: Int, completion: @escaping (Result<CharacteresResult, NetworkError>)->Void)
}

class MainService: ServiceProvider, MainServiceProvider {
    func getCharacteres(page: Int = 1, completion: @escaping (Result<CharacteresResult, NetworkError>)->Void) {
        if ProcessInfo.processInfo.arguments.contains("MOCK") {
            let jsonFileName = "CharactersListAPIResponse"
            let response = Mockable().mock(type: CharacteresResult.self, jsonFile: jsonFileName)
            completion(.success(response))
        } else {
            request(target: CharacteresAPI.list(page: page), completion: completion)
        }
    }
}
