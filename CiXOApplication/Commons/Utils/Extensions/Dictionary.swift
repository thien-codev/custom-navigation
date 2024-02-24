//
//  Endpoint.swift
//  CiXOApplication
//
//  Created by Nguyen Thien on 24/02/2024.
//

import Foundation

extension Dictionary {
    
    var queryString: String? {
        var component = URLComponents()
        component.queryItems = map { URLQueryItem(name: "\($0)", value: "\($1)") }
        return component.query?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
