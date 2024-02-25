//
//  Springboard.swift
//  CiXOApplicationUITests
//
//  Created by Nguyen Thien on 25/02/2024.
//

import Foundation
import XCTest

class Springboard {
    static var main = XCUIApplication(bundleIdentifier: "com.apple.springboard")
    
    private init() {}
    
    private static let REMOVE_APP = "Remove App"
    private static let DELETE_APP = "Delete App"
    private static let DELETE = "Delete"
    
    public class func deleteApp(_ name: String? = "CiXOApplication") {
        // Terminate the application
        XCUIApplication().terminate()
        
        main.activate()
        
        let appName: String
        if let name = name {
            appName = name
        } else {
            let uiTestRunnerName = Bundle.main.infoDictionary?["CFBundleName"] as! String
            appName = uiTestRunnerName.replacingOccurrences(of: "UITests-Runner", with: "")
        }
        
        // Find the appIcon in the springboard's list of icons
        let appIcon = main.icons[appName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)]
        
        // If it exists then we long press it to bring up the context menu
        guard appIcon.exists else { return }
        appIcon.press(forDuration: 2)
        
#if targetEnvironment(simulator)
        // Tap the "Remove App" button on the context menu
        _ = main.buttons[REMOVE_APP].waitForExistence(timeout: 3)
        main.buttons[REMOVE_APP].tap()
        
        // Tap the "Delete App" button on the alert
        _ = main.buttons.elementMatching(text: DELETE_APP).waitForExistence(timeout: 3)
        main.windows.alerts.scrollViews.buttons.elementMatching(text: DELETE_APP).tap()
        
        // Tap the "Delete" button on the alert
        _ = main.buttons.elementMatching(text: DELETE).waitForExistence(timeout: 3)
        main.windows.alerts.scrollViews.buttons.elementMatching(text: DELETE).tap()
#else
        // Tap the "Remove App" button on the context menu
        springboard.buttons[REMOVE_APP].tap()
        // Tap the "Delete App" button on the alert
        springboard.alerts.buttons[DELETE_APP].tap()
        // Tap the "Delete" button on the alert
        springboard.alerts.buttons[DELETE].tap()
#endif
        
    }
    
    public class func reOpenApp(_ name: String? = "CiXOApplication") {
        main.activate()
        
        let appName: String
        if let name = name {
            appName = name
        } else {
            let uiTestRunnerName = Bundle.main.infoDictionary?["CFBundleName"] as! String
            appName = uiTestRunnerName.replacingOccurrences(of: "UITests-Runner", with: "")
        }
        
        // Find the appIcon in the springboard's list of icons
        let appIcon = main.icons[appName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)]
        
        // Tap to open
        guard appIcon.exists else { return }
        appIcon.tap()
    }
}
