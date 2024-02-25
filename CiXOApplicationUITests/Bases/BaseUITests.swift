//
//  BaseUITests.swift
//  CiXOApplicationUITests
//
//  Created by Nguyen Thien on 25/02/2024.
//

import Foundation
import XCTest

class BaseUITests: XCTestCase {
    
    let springboard = Springboard.main
    
    lazy var defaultApplication: XCUIApplication = {
        let app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        return app
    }()
    
    var mainApp: XCUIApplication {
        return defaultApplication
    }
    
    override func setUp() {
        super.setUp()
        mainApp.launch()
    }
    
    override func tearDown() {
        super.tearDown()
        mainApp.terminate()
    }
}

extension BaseUITests {
    func reinstallAndOpenApp() {
        Springboard.deleteApp()
        
        when("Install and launch new app") {
            mainApp.launch()
            sleep(3)
        }
    }
}
