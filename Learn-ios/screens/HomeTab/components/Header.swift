//
//  Header.swift
//  Learn-ios
//
//  Created by APPLE on 25/10/25.
//

import SwiftUI
import BottomSheet

struct Header: View {
    @Binding var bottomSheetPosition: BottomSheetPosition
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello name")
                        .font(.headline)
                    Text("What are you cooking today?")
                        .font(.caption)
                }
                
                Spacer()
                
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(colors.secondary40)
                            .frame(width: 40, height: 40)
                    }
            }
            
            Spacer().frame(height: 24)
            
            HStack {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .foregroundColor(colors.neutral)
                            .frame(width: 18, height: 18)
                        Text("Search for recipes")
                            .foregroundColor(colors.neutral)
                        Spacer()
                    }
                    .frame(height: 40)
                    .padding(.horizontal, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .fill(colors.neutral)
                    }
                }
                Spacer().frame(width: 24)
                Button(action: {
                    bottomSheetPosition = .dynamic
                }) {
                    Image(systemName: "line.3.horizontal.decrease")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 18, height: 18)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(colors.primary)
                                .frame(width: 40, height: 40)
                            
                        }
                }
            }
            
        }
        
    }
}

