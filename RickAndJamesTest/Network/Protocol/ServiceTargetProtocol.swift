//
//  ServiceTargetProtocol.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

protocol ServiceTargetProtocol {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: String] { get }
}

