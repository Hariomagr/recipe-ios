//
//  CustomTextField.swift
//  Learn-ios
//
//  Created by APPLE on 21/10/25.
//

import SwiftUI

struct CustomTextField: View {
    let label: String
    let placeholder: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.system(size: 16))
                .fontWeight(.medium)
            TextField(placeholder, text: $value)
                .padding(12)
                .font(.system(size: 20))
                .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
        }
        .padding(.top, 16)
        
    }
    
}
