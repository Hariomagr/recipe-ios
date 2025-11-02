//
//  coreStorage.swift
//  Learn-ios
//
//  Created by APPLE on 02/11/25.
//

import CoreData

struct CoreStorage {
    
    let container: NSPersistentContainer
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    init () {
        container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (description, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveContext() {
        if (context.hasChanges) {
            do {
                try context.save()
            } catch {
                
            }
        }
    }
    
}
