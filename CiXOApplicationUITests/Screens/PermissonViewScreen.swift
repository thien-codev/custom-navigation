//
//  PermissonViewScreen.swift
//  CiXOApplicationUITests
//
//  Created by Nguyen Thien on 25/02/2024.
//

import Foundation
import XCTest

final class PermissonViewScreen: BaseScreen {
    
    func verifyPermissionView() {
        if !app.descendants(matching: .any)["Permisson view"].waitForExistence(timeout: timeoutExistence) {
            XCTFail("fail: Not found 'Permisson view' text")
        }
        
        if !app.descendants(matching: .any)["Navigate to Homepage"].waitForExistence(timeout: timeoutExistence) {
            XCTFail("fail: Not found 'Navigate to Homepage' text")
        }
    }
    
    func verifyNavigateToHome() {
        if !app.descendants(matching: .any)["Home"].waitForExistence(timeout: timeoutExistence) {
            XCTFail("fail: Should navigate to Home screen")
        }
    }
}

extension PermissonViewScreen {
    func navigateToHomeScreen() {
        let navigateToHomepageButton = app.descendants(matching: .any)["Navigate to Homepage"]
        if !navigateToHomepageButton.waitForExistence(timeout: timeoutExistence) {
            XCTFail("fail: Not found 'Navigate to Homepage' text")
        }
        navigateToHomepageButton.tap()
    }
}
