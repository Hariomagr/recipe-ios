//
//  RegisterView.swift
//  Learn-ios
//
//  Created by APPLE on 21/10/25.
//

import SwiftUI

struct RegisterView: View {
    @Binding var path: [NavigationPath]
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isChecked: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Create an account")
                    .font(.system(size: 24, weight: .bold))
                Spacer().frame(height: 4)
                Text("Let’s help you set up your account,\nit won’t take long.")
                    .font(.system(size: 16, weight: .regular))
                
                CustomTextField(
                    label: "Name",
                    placeholder: "Enter name",
                    value: $name
                )
                
                CustomTextField(
                    label: "Email",
                    placeholder: "Enter email address",
                    value: $email
                )
                
                CustomTextField(
                    label: "Password",
                    placeholder: "Enter password",
                    value: $password
                )
                
                CustomTextField(
                    label: "Confirm passowrd",
                    placeholder: "Retype password",
                    value: $confirmPassword
                )
                
                CustomCheckbox(isChecked: $isChecked, label: "Accept terms and conditions")
                
                CtaButton(isFullWidth: true, onClick: {}, label: "Sign up", hasIcon: true)
                    .padding(.top, 16)
                
                HStack(alignment: .center) {
                    Spacer().frame(width: 80, height: 1).background(colors.neutral)
                    Text("Or Sign in With")
                        .padding(.horizontal, 8)
                        .foregroundColor(colors.neutral)
                    Spacer().frame(width: 80, height: 1).background(colors.neutral)
                }.padding()
                
                GoogleButton()
                
                HStack(alignment: .center, spacing: 4) {
                    Text("Already a member?")
                    Button("Sign In"){
                        path.append(.Login)
                    }
                    .foregroundColor(colors.accent)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            
            Spacer()
        }
        .scrollIndicators(.hidden)
    }
}
