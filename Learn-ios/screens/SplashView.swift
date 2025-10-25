//
//  SplashView.swift
//  Learn-ios
//
//  Created by APPLE on 21/10/25.
//
import SwiftUI

let splashUrl = "https://images.unsplash.com/photo-1618449840665-9ed506d73a34?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=987"

struct SplashView: View {
    
    @Binding var path: [NavigationPath]
    
    func startCooking () {
        path.append(.Login)
    }
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: splashUrl)) {
                image in
                image.resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.9)
            }
            placeholder: {
                ProgressView()
            }
            
            VStack {
                Spacer()
                Text("Get Cooking")
                    .foregroundColor(Color.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 32))
                Spacer().frame(height: 12)
                Text("Simple way to find Tasty Recipe")
                    .foregroundColor(Color.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                Spacer().frame(height: 64)
                CtaButton(isFullWidth: false, onClick: startCooking, label: "Start cooking", hasIcon: true)
                Spacer().frame(height: 72)
            }
            .padding(.horizontal, 24)
        }
        
    }
    
}
