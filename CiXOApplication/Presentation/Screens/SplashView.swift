//
//  SplashView.swift
//  CiXOApplication
//
//  Created by Nguyen Thien on 23/02/2024.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var isActive: Bool
    
    private let duration: TimeInterval = 2
    
    var body: some View {
        ZStack {
            Theme.style.cixoColor
            Image("splash_image")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.width * 3 / 7)
        }
        .ignoresSafeArea()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                withAnimation {
                    isActive = false
                }
            }
        }
    }
}

#Preview {
    SplashView(isActive: .constant(true))
}
