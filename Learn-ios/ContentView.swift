//
//  ContentView.swift
//  Learn-ios
//
//  Created by APPLE on 19/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path: [NavigationPath] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            SplashView(path: $path)
                .navigationBarBackButtonHidden()
                .navigationDestination(for: NavigationPath.self) {
                    navigationpath in
                    switch(navigationpath) {
                    case .Splash:
                        SplashView(path: $path)
                            .navigationBarBackButtonHidden()
                    case .Login:
                        LoginView(path: $path)
                            .navigationBarBackButtonHidden()
                    case .Register:
                        RegisterView(path: $path)
                            .navigationBarBackButtonHidden()
                    case .HomeScreen:
                        HomeScreen(path: $path)
                            .navigationBarBackButtonHidden()
                    }
                }
        }
    }
    
}

#Preview {
    ContentView()
}
