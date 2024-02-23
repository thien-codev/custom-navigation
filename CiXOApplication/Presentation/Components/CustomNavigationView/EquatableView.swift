//
//  EquatableView.swift
//  SojoUK
//
//  Created by ndthien01 on 29/01/2024.
//

import SwiftUI

struct EquatableView: Equatable {
    
    init(view: some View, id: String = UUID().uuidString) {
        self.view = AnyView(view)
        self.id = id
    }
    
    private let id: String
    var view: AnyView
    
    static func == (lhs: EquatableView, rhs: EquatableView) -> Bool {
        lhs.id == rhs.id
    }
}
