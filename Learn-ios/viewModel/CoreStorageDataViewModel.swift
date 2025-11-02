//
//  CoreStorageDataViewModel.swift
//  Learn-ios
//
//  Created by APPLE on 02/11/25.
//
import Foundation
import CoreData

class CoreStorageDataViewModel: ObservableObject {
    
    private var coreStorage = CoreStorage()
    private var context: NSManagedObjectContext { coreStorage.context }
    @Published var recipes: [String] = []
    
    init() {
        getRecipes()
    }
    
    func addRecipe(_recipe: Recipe) {
        let recipeEntity = RecipeEntity(context: context)
        recipeEntity.name = _recipe.name
        recipeEntity.id = Int64(_recipe.id)
        recipeEntity.cuisine = _recipe.cuisine
        recipeEntity.difficulty = _recipe.difficulty
        recipeEntity.prepTimeMinutes = Int64(_recipe.prepTimeMinutes)
        do {
            try context.save()
            getRecipes()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteRecipe(_ id: Int) {
        do {
            let request: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
            request.predicate = NSPredicate(format: "id == %d", id)
            request.fetchLimit = 1
            let res = try context.fetch(request).first
            if let entity = res {
                context.delete(entity)
                try context.save()
                getRecipes()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAll() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = RecipeEntity.fetchRequest()
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

            do {
                try context.execute(deleteRequest)
                try context.save()
                getRecipes()
            } catch {
                print("Delete all error:", error)
            }
    }
    
    func getRecipe(_id: Int) {
        do {
            let req: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
            req.predicate = NSPredicate(format: "id == %d", _id)
            try context.fetch(req).first
        } catch {
            
        }
    }
    
    func getRecipes() {
        do {
            let req: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
            let res = try context.fetch(req)
            recipes = res.compactMap {$0.name}
        } catch {
        }
    }
    
    
}
