//
//  HomescreenViewModel.swift
//  Learn-ios
//
//  Created by APPLE on 01/11/25.
//
import Foundation

@MainActor
class HomeScreenViewModel: ObservableObject {
    @Published var category: String = "All" {
        didSet {
            if (oldValue != category) {
                skip = 0
                total = 0
                Task {
                    recipes = []
                    await fetchData()
                }
            }
        }
    }
    @Published var recipes: [Recipe]?
    @Published var isLoading: Bool = false
    private var skip: Int = 0
    private var total: Int = 0
    private let limit: Int = 10
    
    var hasMore: Bool {
        (recipes ?? []).count < total
    }
    
    func fetchData() async {
        do {
            isLoading = true
            let allRecipes = category == "All" ? try await getAllRecipes(limit: limit, skip: skip) : try await getAllRecipesByTag(limit: limit, skip: skip, tag: category)
            recipes = (recipes ?? []) + allRecipes.recipes
            skip = allRecipes.recipes.count
            total = allRecipes.total
            isLoading = false
        } catch {
            isLoading = false
            print(error.localizedDescription)
        }
    }
    
}
