//
//  MainTabBarView.swift
//  CiXOApplication
//
//  Created by ndthien01 on 23/02/2024.
//

import SwiftUI

struct MainTabBarView: View {
    
    // MARK: - Properties
    @State private var selectedTab:Tab = .home
    
    var body: some View {
        ZStack{
            TabView(selection: $selectedTab,content:  {
                Group {
                    NavigationView {
                        Home()
                    }
                    .tag(Tab.home)
                    
                    NavigationView {
                        Search()
                    }
                    .tag(Tab.setting)
                    
                    NavigationView {
                        Notifications()
                    }
                    .tag(Tab.debug)
                }
            })
            
            VStack{
                Spacer()
                tabBar
            }
        }
    }
    
    private var tabBar: some View {
        HStack(content: {
            Spacer()
            
           
                VStack(alignment: .center, content: {
                    Image(systemName: "homekit")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                })
                .onTapGesture {
//                    withAnimation {
                        selectedTab = .home
//                    }
                }
            
            .foregroundStyle(selectedTab == .home ? Color.primary : Color.secondary)
            Spacer()
            
                VStack(alignment: .center, content: {
                    Image(systemName: "sparkle.magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                })
                .onTapGesture {
//                    withAnimation {
                        selectedTab = .setting
//                    }
                }
            
            .foregroundStyle(selectedTab == .setting ? Color.primary : Color.secondary)
            Spacer()
            
                VStack(alignment: .center, content: {
                    Image(systemName: "bell.badge.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                })
                .onTapGesture {
//                    withAnimation {
                        selectedTab = .debug
//                    }
                }
            
            .foregroundStyle(selectedTab == .debug ? Color.primary : Color.secondary)
            Spacer()
            
        })
        .padding()
        .frame(height: 80)
        .background {
            Rectangle()
                .fill(Color.white)
        }
    }
}

#Preview {
    MainTabBarView()
}

struct Home: View {
    var body: some View {
        Color.yellow.ignoresSafeArea()
    }
}

struct Search: View {
    var body: some View {
        Color.red.ignoresSafeArea()
    }
}

struct Notifications:View {
    var body: some View {
        Color.blue.ignoresSafeArea()
    }
}

enum Tab {
    case home
    case setting
    case debug
}

