//
//  Persistence.swift
//  viper-assignment
//
//  Created by Artem Tebenkov on 03.07.2024.
//

import CoreData

final class PersistenceController {
    static let shared = PersistenceController()

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "viper_assignment")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()

    func saveContext() {
        guard viewContext.hasChanges else { return }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            NSLog("Unresolved error saving context: \(nsError), \(nsError.userInfo)")
        }
    }

    func fetch<T: NSManagedObject>(_ request: NSFetchRequest<T>) -> [T] {
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
}
