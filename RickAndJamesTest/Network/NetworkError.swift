//
//  NetworkError.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case connectionFailure(Error)
    case noData
    case parseError(Error)
}
