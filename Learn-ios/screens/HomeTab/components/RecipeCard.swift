//
//  RecipeCard.swift
//  Learn-ios
//
//  Created by APPLE on 25/10/25.
//

import SwiftUI

struct RecipeCard: View {
    var index: Int
    private let image = "https://images.unsplash.com/photo-1602881917445-0b1ba001addf?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1480"
    
    @State private var isPressed: Bool = false
    
    func handleButtonPress() {
        isPressed.toggle()
    }
    
    var body: some View {
        ZStack(alignment: .top) {

            AsyncImage(url: URL(string: image)) {
                phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                        .frame(width: 110, height: 110)
                        .cornerRadius(110)
                default:
                    Circle()
                        .frame(width: 110, height: 110)
                        .background(Color.gray)
                        .opacity(0.1)
                        .cornerRadius(110)
                }
            }
            .zIndex(1)
            
            VStack(alignment: .center) {
                Text("Classic Greek Salad")
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.caption)
                        Text("15 Mins")
                            .font(.caption)
                    }
                    Spacer()
                    Button(action: handleButtonPress) {
                        Image(systemName: "bookmark")
                            .resizable()
                            .frame(width: 12, height: 12)
                            .background {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 24, height: 24)
                            }
                            .foregroundColor(isPressed ? colors.primary : colors.gray3)
                    }
                    
                }
                .padding(.bottom, 8)
            }
            .padding(.top, 65)
            .padding(.horizontal, 12)
            .frame(height: 196)
            .frame(maxWidth: .infinity)
            .background(colors.neutral50)
            .cornerRadius(12)
            .padding(.top, 55)
            .zIndex(0)
            
        }
        .frame(height: 196 + 55, alignment: .top)
        .padding(.trailing, index%2==0 ? 8 : 0)
        .padding(.leading, index%2==0 ? 0 : 8)
    }
}
