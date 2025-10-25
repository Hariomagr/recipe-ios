//
//  LoginView.swift
//  Learn-ios
//
//  Created by APPLE on 21/10/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var path: [NavigationPath]
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    func login() {
        
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello,")
                .fontWeight(.heavy)
                .font(.system(size: 30))
            Spacer().frame(height: 4)
            Text("Welcome Back!")
                .fontWeight(.regular)
                .font(.system(size: 20))
            
            Spacer().frame(height: 32)
            CustomTextField(label: "Email", placeholder: "Enter email", value: $email)
            CustomTextField(label: "Password", placeholder: "Enter password", value: $password)
            
            Button("Forgot Password?") {
                
            }
            .foregroundColor(colors.accent)
            .padding(.top, 8)
            
            Spacer().frame(height: 32)
            CtaButton(isFullWidth: true, onClick: login, label: "Sign In")
            
            HStack(alignment: .center) {
                Spacer().frame(width: 80, height: 1).background(colors.neutral)
                Text("Or Sign in With")
                    .padding(.horizontal, 8)
                    .foregroundColor(colors.neutral)
                Spacer().frame(width: 80, height: 1).background(colors.neutral)
            }
            .padding(.top, 32)
            .frame(maxWidth: .infinity, alignment: .center)
            
            GoogleButton()
            
            HStack(alignment: .center, spacing: 4) {
                Text("Don’t have an account?")
                Button("Sign up"){
                    path.append(.Register)
                }
                .foregroundColor(colors.accent)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 32)
            
           
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 24)
        
    }
}
