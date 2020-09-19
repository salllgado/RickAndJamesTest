//
//  CharacterResult.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 19/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

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
