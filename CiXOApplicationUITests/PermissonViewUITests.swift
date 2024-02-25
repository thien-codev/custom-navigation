//
//  PermissonViewUITests.swift
//  CiXOApplicationUITests
//
//  Created by Nguyen Thien on 25/02/2024.
//

import Foundation
import XCTest

class PermissonViewUITests: BaseUITests {
    
    private var permissionView: PermissonViewScreen!
    
    override func setUp() {
        super.setUp()
        permissionView = PermissonViewScreen(app: mainApp)
    }
    
    override func tearDown() {
        super.tearDown()
        permissionView = nil
    }
    
    func testUIElement() {
        given("Reinstall application") {
            reinstallAndOpenApp()
        }
        
        then("Verify permission view") {
            permissionView.verifyPermissionView()
        }
        
        when("Tap on 'Navigate to Homepage'") {
            permissionView.navigateToHomeScreen()
        }
        
        then("Verify navigate to home view") {
            permissionView.verifyNavigateToHome()
        }
    }
}
