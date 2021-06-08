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
    
    private(set) var widgetURL: URL?
    
    init(
        id: Int,
        name: String,
        status: String,
        species: String,
        gender: String,
        image: String,
        location: CharacterLocationResult,
        widgetURL: URL? = nil
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.image = image
        self.location = location
        self.widgetURL = widgetURL
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case gender
        case image
        case location
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        status = try container.decode(String.self, forKey: .status)
        species = try container.decode(String.self, forKey: .species)
        gender = try container.decode(String.self, forKey: .gender)
        image = try container.decode(String.self, forKey: .image)
        location = try container.decode(CharacterLocationResult.self, forKey: .location)
        widgetURL = URL(string: "rickAndJames://detail?characterId=\(id)")
    }
}
