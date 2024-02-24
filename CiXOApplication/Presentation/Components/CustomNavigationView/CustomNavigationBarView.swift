//
//  CustomNavigationBarView.swift
//  SojoUK
//
//  Created by ndthien01 on 29/01/2024.
//

import SwiftUI

struct CustomNavigationBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var navBarStyle: CustomNavigationBarStyle
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 0) {
                Text(navBarStyle.title)
                    .font(.system(size: 17, weight: .semibold))
                HStack {
                    if let leftItem = navBarStyle.leftItem {
                        leftItem
                    } else {
                        defaultLeftItem
                    }
                    Spacer()
                    if let rightItem = navBarStyle.rightItem {
                        rightItem
                    }
                }
                .padding(.bottom)
            }
        }
        .padding([.leading, .trailing])
        .foregroundColor(navBarStyle.tintColor)
        .frame(height: navBarStyle.height)
        .background(navBarStyle.backgroundColor)
    }
    
    private var defaultLeftItem: some View {
        Image("axonvibe_icon")
            .resizable()
            .scaledToFit()
            .frame(height: 26)
            .foregroundColor(.white)
    }
}
