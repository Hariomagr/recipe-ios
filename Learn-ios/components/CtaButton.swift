//
//  CtaButton.swift
//  Learn-ios
//
//  Created by APPLE on 21/10/25.
//

import SwiftUI

struct CtaButton: View {
    let isFullWidth: Bool
    let onClick: () -> Void
    let label: String
    let hasIcon: Bool
    let isLoading: Bool
    
    init(isFullWidth: Bool = false, onClick: @escaping () -> Void, label: String, hasIcon: Bool = false, isLoading: Bool = false) {
           self.isFullWidth = isFullWidth
           self.onClick = onClick
           self.label = label
           self.hasIcon = hasIcon
           self.isLoading = isLoading
       }
    
    var body: some View {
        HStack {
            Button(action: onClick) {
               
                HStack {
                    isFullWidth ? Spacer() : nil
                    if isLoading {
                        ProgressView()
                    } else {
                        Text(label)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        hasIcon ? Image(systemName: "arrow.right")
                            .tint(Color.white) : nil
                        isFullWidth ? Spacer() : nil
                    }
                }
            
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 24)
            .background(colors.primary)
            .cornerRadius(8)
        }
    }
}
