//
//  InfoResult.swift
//  RickAndJamesTest
//
//  Created by Chrystian on 21/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

struct InfoResult: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
