//
//  CharacterResultDummy.swift
//  RickAndJamesWidgetExtension
//
//  Created by Chrystian Salgado on 08/06/21.
//  Copyright © 2021 Salgado Solutions. All rights reserved.
//

import Foundation

extension CharacterResult {
    
    static func getDummy() -> CharacterResult {
        CharacterResult(
            id: 1,
            name: "Rick and James",
            status: "Alive",
            species: "Human",
            gender: "Male",
            image: " ",
            location: CharacterLocationResult(name: "Earth")
        )
    }
    
    static func getEmpty() -> CharacterResult {
        CharacterResult(
            id: 1,
            name: "--",
            status: "--",
            species: "--",
            gender: "--",
            image: "--",
            location: CharacterLocationResult(name: "--")
        )
    }
}
