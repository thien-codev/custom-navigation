//
//  BaseScreen.swift
//  CiXOApplicationUITests
//
//  Created by Nguyen Thien on 25/02/2024.
//

import Foundation
import XCTest

open class BaseScreen {
    
    let app: XCUIApplication
    
    open var timeoutExistence: TimeInterval {
        return 5
    }
    
    public init(app: XCUIApplication) {
        self.app = app
    }
}
