//
//  CustomNavigationBarStyle.swift
//  SojoUK
//
//  Created by ndthien01 on 29/01/2024.
//

import SwiftUI

class CustomNavigationBarStyle: Equatable {
    
    static var `default` = CustomNavigationBarStyle()
    
    var id: String { UUID().uuidString }
    var title: String = .init()
    var backgroundColor: Color = Theme.style.cixoColor
    var tintColor: Color = .white
    var height: CGFloat = 120
    var leftItem: EquatableView? = nil
    var rightTitle: String = .init()
    
    @discardableResult
    func set(title: String) -> Self {
        self.title = title
        return self
    }
    
    @discardableResult
    func set(backgroundColor: SwiftUI.Color) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    func set(tintColor: SwiftUI.Color) -> Self {
        self.tintColor = tintColor
        return self
    }
    
    @discardableResult
    func set(height: CGFloat) -> Self {
        self.height = height
        return self
    }
    
    @discardableResult
    func set(leftItem: EquatableView?) -> Self {
        self.leftItem = leftItem
        return self
    }
    
    @discardableResult
    func set(rightTitle: String) -> Self {
        self.rightTitle = rightTitle
        return self
    }
    
    @discardableResult
    static func == (lhs: CustomNavigationBarStyle, rhs: CustomNavigationBarStyle) -> Bool {
        lhs.id == rhs.id
    }
}
