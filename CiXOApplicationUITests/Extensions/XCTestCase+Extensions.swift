//
//  XCTestCase+Extensions.swift
//  CiXOApplicationUITests
//
//  Created by Nguyen Thien on 25/02/2024.
//

import Foundation
import XCTest

extension XCTestCase {
    
    func given<A>(_ description: String, block: () throws -> A) rethrows -> A {
        return try XCTContext.runActivity(named: "Given " + description, block: { _ in try block() })
    }

    func when<A>(_ description: String, block: () throws -> A) rethrows -> A {
        return try XCTContext.runActivity(named: "When " + description, block: { _ in try block() })
    }
    
    func and<A>(_ description: String, block: () throws -> A) rethrows -> A {
        return try XCTContext.runActivity(named: "And " + description, block: { _ in try block() })
    }

    func then<A>(_ description: String, block: () throws -> A) rethrows -> A {
        return try XCTContext.runActivity(named: "Then " + description, block: { _ in try block() })
    }
}
