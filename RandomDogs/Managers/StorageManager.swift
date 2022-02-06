//
//  StorageManager.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 28.01.2022.
//

import CoreData
import UIKit

protocol StorageManagerInterface {
    func createDogDataModel(with title: String, image: UIImage, needToSave: Bool) throws
    func fetchDogs() -> [DogDataModel]
    func delete(dog: DogDataModel) throws
}

final class StorageManager {
    
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    var persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext

    private init() {
        persistentContainer = NSPersistentContainer(name: "RandomDogs")
        persistentContainer.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        context = persistentContainer.viewContext
    }

    private func saveContext() throws {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                throw error
            }
        }
    }
}

extension StorageManager: StorageManagerInterface {
    func createDogDataModel(with title: String, image: UIImage, needToSave: Bool) throws {
        if let data = image.pngData() {
            let entity = DogDataModel(context: context)
            entity.image = data
            entity.title = title

            if needToSave { try saveContext() }
        }
    }

    func fetchDogs() -> [DogDataModel] {
        let fetchRequest: NSFetchRequest<DogDataModel> = DogDataModel.fetchRequest()
        let dogDataModels = try? context.fetch(fetchRequest)

        return dogDataModels ?? []
    }

    func delete(dog: DogDataModel) throws {
        context.delete(dog)
        try saveContext()
    }
    
    func edit(dog: DogDataModel, newname: String) throws {
        dog.title = newname
        try saveContext()
    }
}
