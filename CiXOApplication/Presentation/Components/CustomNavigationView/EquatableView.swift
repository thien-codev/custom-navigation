//
//  EquatableView.swift
//  SojoUK
//
//  Created by ndthien01 on 29/01/2024.
//

import SwiftUI

struct EquatableView: Equatable {
    
    private let id: String = UUID().uuidString
    var view: AnyView
    
    static func == (lhs: EquatableView, rhs: EquatableView) -> Bool {
        lhs.id == rhs.id
    }
}
