//
//  MainTabBarView.swift
//  CiXOApplication
//
//  Created by ndthien01 on 23/02/2024.
//

import SwiftUI

struct MainTabBarView: View {
    
    enum Tab {
        case home
        case setting
        case debug
        
        var title: String {
            switch self {
            case .home:
                return "home_tabbar_title".localised()
            case .setting:
                return "setting_tabbar_title".localised()
            case .debug:
                return "debug_tabbar_title".localised()
            }
        }
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
        .onAppear {
            navBarStyle = .default.set(rightItem: rightItem)
        }
    }
    
    private var rightItem: AnyView {
        Text(selectedTab.title)
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
                            guard selectedTab != .home else { return }
                            selectedTab = .home
                        }
                        .foregroundStyle(selectedTab == .home ? theme.cixoColor : Color.secondary)
                    
                    Image("setting_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .onTapGesture {
                            guard selectedTab != .setting else { return }
                            selectedTab = .setting
                        }
                        .foregroundStyle(selectedTab == .setting ? theme.cixoColor : Color.secondary)
                    
                    Image("debug_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .onTapGesture {
                            guard selectedTab != .debug else { return }
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
