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

/*
"""
"id": 1,
"name": "Rick Sanchez",
"status": "Alive",
"species": "Human",
"type": "",
"gender": "Male",
"origin": {
    "name": "Earth (C-137)",
    "url": "https://rickandmortyapi.com/api/location/1"
},
"location": {
    "name": "Earth (Replacement Dimension)",
    "url": "https://rickandmortyapi.com/api/location/20"
},
"image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
"episode": [
    "https://rickandmortyapi.com/api/episode/1",
    "https://rickandmortyapi.com/api/episode/2",
    "https://rickandmortyapi.com/api/episode/41"
],
"url": "https://rickandmortyapi.com/api/character/1",
"created": "2017-11-04T18:48:46.250Z
"""
*/

struct CharacterResult: Decodable {
    let id: Int
    let name: String
    let status: String // alive
    let species: String // Human
    let gender: String
    let image: String
    
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
