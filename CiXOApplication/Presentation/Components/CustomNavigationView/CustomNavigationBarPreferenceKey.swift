//
//  CustomNavigationBarPreferenceKey.swift
//  SojoUK
//
//  Created by ndthien01 on 29/01/2024.
//

import SwiftUI

struct CustomNavigationBarHiddenPreferenceKey: PreferenceKey {
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

struct CustomNavigationBarStylePreferenceKey: PreferenceKey {
    static var defaultValue: CustomNavigationBarStyle = .init()
    
    static func reduce(value: inout CustomNavigationBarStyle, nextValue: () -> CustomNavigationBarStyle) {
        value = nextValue()
    }
}

extension View {
    func customNaigationBarStyle(_ style: CustomNavigationBarStyle) -> some View {
        preference(key: CustomNavigationBarStylePreferenceKey.self, value: style)
    }
    
    func customNaigationBarHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavigationBarHiddenPreferenceKey.self, value: hidden)
    }
}
