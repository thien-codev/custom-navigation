//
//  CustomNavigationBarContainerView.swift
//  SojoUK
//
//  Created by ndthien01 on 29/01/2024.
//

import SwiftUI

struct CustomNavigationBarContainerView<Content: View>: View {
    
    @State var navBarStyle: CustomNavigationBarStyle = .init()
    @State var barHidden: Bool = false
    
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            if !barHidden {
                CustomNavigationBarView(navBarStyle: navBarStyle)
                    .zIndex(1)
                    .eraseToAnyView()
            }
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.top, barHidden ? 0 : navBarStyle.height)
                .onPreferenceChange(CustomNavigationBarStylePreferenceKey.self, perform: { value in
                    navBarStyle = value
                })
                .onPreferenceChange(CustomNavigationBarHiddenPreferenceKey.self, perform: { value in
                    barHidden = value
                })
        }
        .ignoresSafeArea(edges: .top)
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        return AnyView(self)
    }
}
