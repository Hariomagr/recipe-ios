//
//  RecipeCard.swift
//  Learn-ios
//
//  Created by APPLE on 25/10/25.
//

import SwiftUI

struct RecipeCard: View {
    var recipe: Recipe
    var index: Int
    
    @StateObject var favoriteManager = FavoritesManager()
    
    var isFavorite: Bool {
        favoriteManager.isFavorite(id: recipe.id)
    }
    
    func handleButtonPress() {
        favoriteManager.toggleFavorite(id: recipe.id)
    }
    
    var body: some View {
        ZStack(alignment: .top) {

            AsyncImage(url: URL(string: recipe.image)) {
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
                Text(recipe.name)
                    .multilineTextAlignment(.center)
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Time")
                            .font(.caption)
                        Text("\(recipe.prepTimeMinutes) Mins")
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
                            .foregroundColor(isFavorite ? colors.primary : colors.gray3)
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
