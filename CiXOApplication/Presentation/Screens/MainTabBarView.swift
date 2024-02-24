//
//  MainTabBarView.swift
//  CiXOApplication
//
//  Created by ndthien01 on 23/02/2024.
//

import SwiftUI

struct MainTabBarView: View {
    
    enum Tab: String {
        case home = "Home"
        case setting = "Setting"
        case debug = "Debug"
    }
    
    // MARK: - Properties
    @State private var navBarStyle: CustomNavigationBarStyle = .default
    @State private var selectedTab: Tab = .home {
        didSet {
            navBarStyle = navBarStyle.set(rightItem: rightItem)
        }
    }
    
    private let tabbarHeight: CGFloat = 80
    private let theme = Theme.style
    
    var body: some View {
        CustomNavigationView {
            ZStack{
                TabView(selection: $selectedTab,content:  {
                    HomeView().tag(Tab.home)
                    SettingView().tag(Tab.setting)
                    DebugView().tag(Tab.debug)
                })
                VStack{
                    Spacer()
                    tabBar
                }
            }
            .ignoresSafeArea()
            .customNaigationBarStyle(navBarStyle)
        }
        .onAppear {
            navBarStyle = .default.set(rightItem: rightItem)
        }
    }
    
    private var rightItem: AnyView {
        Text(selectedTab.rawValue)
            .font(.system(size: 18, weight: .semibold)).eraseToAnyView()
    }
    
    private var tabBar: some View {
        VStack {
            Divider()
            Spacer()
            HStack(content: {
                Group {
                    Image("home_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .onTapGesture {
                            selectedTab = .home
                        }
                        .foregroundStyle(selectedTab == .home ? theme.cixoColor : Color.secondary)
                    
                    
                    Image("setting_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .onTapGesture {
                            selectedTab = .setting
                        }
                        .foregroundStyle(selectedTab == .setting ? theme.cixoColor : Color.secondary)
                    
                    
                    Image("debug_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .onTapGesture {
                            selectedTab = .debug
                        }
                        .foregroundStyle(selectedTab == .debug ? theme.cixoColor : Color.secondary)
                }
                .frame(maxWidth: .infinity)
            })
            Spacer()
        }
        .frame(width: UIScreen.width, height: 80)
        .background {
            Rectangle()
                .fill(Color.white)
        }
    }
}

#Preview {
    MainTabBarView()
}
