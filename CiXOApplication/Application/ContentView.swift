//
//  ContentView.swift
//  CiXOApplication
//
//  Created by ndthien01 on 20/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomNavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .customNaigationBarStyle(.init().set(rightItem: rightItem))
        }
    }
    
    var rightItem: EquatableView {
        EquatableView(view: AnyView(Text("CiXO").font(.system(size: 18, weight: .semibold))))
    }
}

#Preview {
    ContentView()
}
