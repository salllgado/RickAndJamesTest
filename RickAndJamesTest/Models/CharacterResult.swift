//
//  CharacterResult.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 21/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

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
