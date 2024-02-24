//
//  PermissionView.swift
//  CiXOApplication
//
//  Created by Nguyen Thien on 23/02/2024.
//

import SwiftUI

struct PermissionView: View {
    var body: some View {
        CustomNavigationView {
            VStack {
                Text("Permisson view")
                CustomNavigationLink {
                    MainTabBarView()
                        .customNaigationBarHidden(true)
                } label: {
                    Text("Navigate to Homepage")
                }
            }
        }
    }
}

#Preview {
    PermissionView()
}
