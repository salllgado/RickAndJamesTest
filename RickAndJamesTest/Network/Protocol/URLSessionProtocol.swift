//
//  URLSessionProtocol.swift
//  RickAndJamesTest
//
//  Created by Chrystian Salgado on 07/09/20.
//  Copyright © 2020 Salgado Solutions. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}
