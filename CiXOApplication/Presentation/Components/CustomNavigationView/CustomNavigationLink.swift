//
//  CustomNavigationLink.swift
//  SojoUK
//
//  Created by ndthien01 on 29/01/2024.
//

import SwiftUI

struct CustomNavigationLink<Destination: View, Label: View>: View {
    
    private let destination: Destination
    private let label: Label
    
    init(@ViewBuilder destination: () -> Destination, @ViewBuilder label: () -> Label) {
        self.label = label()
        self.destination = destination()
    }
    
    var body: some View {
        NavigationLink {
            CustomNavigationBarContainerView {
                destination
            }
            .navigationBarHidden(true)
        } label: {
            label
        }
    }
}
