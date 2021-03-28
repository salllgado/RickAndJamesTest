//
//  CharacteresResult.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 21/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

struct CharacteresResult: Decodable {
    let info: InfoResult
    let character: [CharacterResult]
    
    enum CodingKeys: String, CodingKey {
        case info
        case character = "results"
    }
}
