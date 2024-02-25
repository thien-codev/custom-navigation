//
//  XCUIElement+Extensions.swift
//  CiXOApplicationUITests
//
//  Created by Nguyen Thien on 25/02/2024.
//

import Foundation
import XCTest

extension XCUIElementQuery {
    func elementMatching(text: String) -> XCUIElement {
        let predicate = NSPredicate(format: "label CONTAINS %@", text)
        return self.element(matching: predicate)
    }
}
