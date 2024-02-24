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
    static var defaultValue:CustomNavigationBarStyle = .default
    
    static func reduce(value: inout CustomNavigationBarStyle, nextValue: () -> CustomNavigationBarStyle) {
        value = nextValue()
    }
}

extension View {
    func customNaigationBarHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavigationBarHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNaigationBarStyle(_ value: CustomNavigationBarStyle) -> some View {
        preference(key: CustomNavigationBarStylePreferenceKey.self, value: value)
    }
}
