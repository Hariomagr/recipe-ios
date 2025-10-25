//
//  CustomCheckbox.swift
//  Learn-ios
//
//  Created by APPLE on 25/10/25.
//

import SwiftUI

struct CustomCheckbox: View {
    @Binding var isChecked: Bool
    var label: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .foregroundColor(colors.accent)
                .frame(width: 20, height: 20)
                .onTapGesture {
                    isChecked.toggle()
                }
            
            Text("Accept terms & Condition")
            
        }
        .padding(.top, 12)
    }
}
