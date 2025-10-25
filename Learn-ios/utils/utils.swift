//
//  utils.swift
//  Learn-ios
//
//  Created by APPLE on 21/10/25.
//

import SwiftUICore

enum NavigationPath: String {
    case Splash = "Splash"
    case Login = "Login"
    case Register = "Register"
}

struct colors {
    static let primary: Color = Color(red: 18/255, green: 149/255, blue: 117/255)
    static let accent: Color = Color(red: 255/255, green: 156/255, blue: 0/255)
    static let neutral: Color = Color(red: 217/255, green: 217/255, blue: 217/255)
    static let neutral50: Color = Color(red: 217/255, green: 217/255, blue: 217/255, opacity: 0.5)
    static let secondary40: Color = Color(red: 255/255, green: 206/255, blue: 128/255)
    static let gray3: Color = Color(red: 169/255, green: 169/255, blue: 169/255)
}
