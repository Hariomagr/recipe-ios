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
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isLoading: Bool = false
    
    var isDisabled: Bool {
        return email.isEmpty || password.isEmpty
    }
    
    private func onSignInSuccess() {
        path = [.HomeScreen]
    }
    
    func login() {
        Task {
            do {
                isLoading = true
                try await signInUserWithEmail(email: email, password: password)
                onSignInSuccess()
            }
            catch {
                isLoading = false
                showAlert = true
                alertMessage = error.localizedDescription
            }
        }
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
            
            Spacer().frame(height: 32)
            CtaButton(isFullWidth: true, onClick: login, label: "Sign In", hasIcon: true, isLoading: isLoading)
                .disabled(isDisabled)
            
            HStack(alignment: .center) {
                Spacer().frame(width: 80, height: 1).background(colors.neutral)
                Text("Or Sign in With")
                    .padding(.horizontal, 8)
                    .foregroundColor(colors.neutral)
                Spacer().frame(width: 80, height: 1).background(colors.neutral)
            }
            .padding(.top, 32)
            .frame(maxWidth: .infinity, alignment: .center)
            
            GoogleButton(onSuccess: onSignInSuccess)
            
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
        .alert("Error occurred", isPresented: $showAlert) {
        } message: {
            Text(alertMessage)
        }
    }
}
