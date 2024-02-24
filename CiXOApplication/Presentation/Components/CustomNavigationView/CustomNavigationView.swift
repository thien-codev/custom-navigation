//
//  CustomNavigationView.swift
//  SojoUK
//
//  Created by ndthien01 on 29/01/2024.
//

import SwiftUI

struct CustomNavigationView<Content: View>: View {
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView(content: {
            CustomNavigationBarContainerView {
                content.eraseToAnyView()
            }
            .navigationBarHidden(true)
        })
    }
}
