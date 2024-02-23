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

struct CustomNavigationBarRightTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = .init()
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

extension View {
    func customNaigationBarHidden(_ hidden: Bool) -> some View {
        preference(key: CustomNavigationBarHiddenPreferenceKey.self, value: hidden)
    }
    
    func customNaigationBarRightTitle(_ string: String) -> some View {
        preference(key: CustomNavigationBarRightTitlePreferenceKey.self, value: string)
    }
}
