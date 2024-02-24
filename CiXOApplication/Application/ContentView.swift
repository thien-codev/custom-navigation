//
//  ContentView.swift
//  CiXOApplication
//
//  Created by ndthien01 on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var activeSplash: Bool = true
    
    var body: some View {
        Group {
            if activeSplash {
                SplashView(isActive: $activeSplash)
            } else {
                PermissionView()
            }
        }
    }
}

#Preview {
    ContentView()
}
