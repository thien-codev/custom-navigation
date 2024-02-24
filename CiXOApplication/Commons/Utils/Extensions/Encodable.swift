//
//  Endpoint.swift
//  CiXOApplication
//
//  Created by Nguyen Thien on 24/02/2024.
//

import Foundation

extension Encodable {
    func toDictionary() -> JSONDictionary? {
        do {
            let data = try JSONEncoder().encode(self)
            let josnData = try JSONSerialization.jsonObject(with: data)
            return josnData as? JSONDictionary
        } catch {
            return nil
        }
    }
}
