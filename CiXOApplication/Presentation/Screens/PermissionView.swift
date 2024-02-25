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
                Text("permission_view".localised())
                CustomNavigationLink {
                    MainTabBarView()
                        .eraseToAnyView()
                } label: {
                    Text("navigate_to_home".localised())
                }
            }
        }
    }
}

#Preview {
    PermissionView()
}
