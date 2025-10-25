//
//  HomeScreen.swift
//  Learn-ios
//
//  Created by APPLE on 25/10/25.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var path: [NavigationPath]
    
    init(path: Binding<[NavigationPath]>) {
        self._path = path
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.shadowColor = UIColor.lightGray
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            HomeTab()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            SecondTab()
                .tabItem{
                    Label("Saved", systemImage: "heart")
                }
            ThirdTab()
                .tabItem{
                    Label("Settings", systemImage: "person")
            }
        }
        .tint(colors.primary)
    }
}

struct SecondTab: View {
    var body: some View {
        Text("Second Tab")
    }
}

struct ThirdTab: View {
    var body: some View {
        Text("Third Tab")
    }
}
